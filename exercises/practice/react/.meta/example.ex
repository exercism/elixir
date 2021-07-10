defmodule React do
  use GenServer

  defmodule InputCell do
    defstruct [:name, :value]
    @type t :: %InputCell{name: String.t(), value: any}
  end

  defmodule OutputCell do
    defstruct [:name, :inputs, :compute, :value, callbacks: %{}]

    @type t :: %OutputCell{
            name: String.t(),
            inputs: [String.t()],
            compute: fun(),
            value: any,
            callbacks: %{String.t() => fun()}
          }
  end

  # CLIENT SIDE

  @opaque cells :: pid

  @type cell :: {:input, String.t(), any} | {:output, String.t(), [String.t()], fun()}

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [cell]) :: {:ok, pid}
  def new(cells) do
    GenServer.start_link(React, cells)
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(cells :: pid, cell_name :: String.t()) :: any()
  def get_value(cells, cell_name) do
    GenServer.call(cells, {:get_value, cell_name})
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(cells :: pid, cell_name :: String.t(), value :: any) :: :ok
  def set_value(cells, cell_name, value) do
    GenServer.cast(cells, {:set_value, cell_name, value})
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(
          cells :: pid,
          cell_name :: String.t(),
          callback_name :: String.t(),
          callback :: fun()
        ) :: :ok
  def add_callback(cells, cell_name, callback_name, callback) do
    GenServer.cast(cells, {:add_callback, cell_name, callback_name, callback})
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell_name :: String.t(), callback_name :: String.t()) :: :ok
  def remove_callback(cells, cell_name, callback_name) do
    GenServer.cast(cells, {:remove_callback, cell_name, callback_name})
  end

  # SERVER SIDE

  defmodule State do
    defstruct [:cells, :dependencies]
  end

  @impl true
  def init(cells) do
    cells =
      Map.new(cells, fn
        {:input, name, value} ->
          {name, %InputCell{name: name, value: value}}

        {:output, name, inputs, compute} ->
          {name, %OutputCell{name: name, inputs: inputs, compute: compute}}
      end)

    initialized_cells =
      Map.new(cells, fn {name, cell} -> {name, initialize_value(cell, cells)} end)

    dependencies =
      Enum.reduce(cells, %{}, fn
        {name, %OutputCell{inputs: [a]}}, deps ->
          Map.update(deps, a, [name], fn names -> [name | names] end)

        {name, %OutputCell{inputs: [a, b]}}, deps ->
          Map.update(deps, a, [name], fn names -> [name | names] end)
          |> Map.update(b, [name], fn names -> [name | names] end)

        _input, deps ->
          deps
      end)

    {:ok, %State{cells: initialized_cells, dependencies: dependencies}}
  end

  @impl true
  def handle_call({:get_value, name}, _from, %State{cells: cells} = state) do
    {:reply, cells[name].value, state}
  end

  @impl true
  def handle_cast({:set_value, name, value}, %State{cells: cells, dependencies: deps} = state) do
    %InputCell{} = input = cells[name]

    cells =
      Map.put(cells, name, %{input | value: value})
      |> update_dependencies(deps[name], deps)

    {:noreply, %{state | cells: cells}}
  end

  @impl true
  def handle_cast({:add_callback, name, callback_name, callback}, %State{cells: cells} = state) do
    %OutputCell{callbacks: callbacks} = cell = cells[name]
    callbacks = Map.put(callbacks, callback_name, callback)
    {:noreply, %{state | cells: Map.put(cells, name, %{cell | callbacks: callbacks})}}
  end

  @impl true
  def handle_cast({:remove_callback, name, callback_name}, %State{cells: cells} = state) do
    %OutputCell{callbacks: callbacks} = cell = cells[name]
    callbacks = Map.delete(callbacks, callback_name)
    {:noreply, %{state | cells: Map.put(cells, name, %{cell | callbacks: callbacks})}}
  end

  defp initialize_value(%OutputCell{value: nil, inputs: [a], compute: f} = cell, cells) do
    reference = initialize_value(cells[a], cells)
    %{cell | value: f.(reference.value)}
  end

  defp initialize_value(%OutputCell{value: nil, inputs: [a, b], compute: f} = cell, cells) do
    reference_a = initialize_value(cells[a], cells)
    reference_b = initialize_value(cells[b], cells)
    %{cell | value: f.(reference_a.value, reference_b.value)}
  end

  defp initialize_value(cell, _cells), do: cell

  defp update_dependencies(cells, [name | to_update], dependencies) do
    cell = cells[name]

    value =
      case cell do
        %OutputCell{inputs: [a], compute: f} -> f.(cells[a].value)
        %OutputCell{inputs: [a, b], compute: f} -> f.(cells[a].value, cells[b].value)
      end

    cells = Map.put(cells, name, %{cell | value: value})

    if(value == cell.value) do
      update_dependencies(cells, to_update, dependencies)
    else
      cells = Map.put(cells, cell, %{cell | value: value})

      Enum.each(cell.callbacks, fn {name, send} -> send.(name, value) end)

      next = Map.get(dependencies, name, [])
      update_dependencies(cells, to_update ++ next, dependencies)
    end
  end

  defp update_dependencies(cells, _empty, _dependencies), do: cells
end
