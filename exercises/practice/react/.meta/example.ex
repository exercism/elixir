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
            compute: (... -> any),
            value: any,
            callbacks: %{String.t() => (String.t(), any -> :ok)}
          }
  end

  # CLIENT SIDE

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [InputCell.t() | OutputCell.t()]) :: {:ok, pid}
  def new(cells) do
    GenServer.start_link(React, cells)
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(cells :: pid, cell :: String.t()) :: any()
  def get_value(cells, cell) do
    GenServer.call(cells, {:get_value, cell})
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(cells :: pid, cell :: String.t(), value :: any) :: :ok
  def set_value(cells, cell, value) do
    GenServer.cast(cells, {:set_value, cell, value})
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(
          cells :: pid,
          cell :: String.t(),
          callback :: String.t(),
          send :: (String.t(), any -> :ok)
        ) :: :ok
  def add_callback(cells, cell, callback, send) do
    GenServer.cast(cells, {:add_callback, cell, callback, send})
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell :: String.t(), callback :: String.t()) :: :ok
  def remove_callback(cells, cell, callback) do
    GenServer.cast(cells, {:remove_callback, cell, callback})
  end

  # SERVER SIDE

  defmodule State do
    defstruct [:cells, :dependencies]
  end

  @impl true
  def init(cells) do
    cells = Map.new(cells, fn cell -> {cell.name, cell} end)

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
  def handle_cast({:add_callback, name, callback, send}, %State{cells: cells} = state) do
    %OutputCell{callbacks: callbacks} = cell = cells[name]
    callbacks = Map.put(callbacks, callback, send)
    {:noreply, %{state | cells: Map.put(cells, name, %{cell | callbacks: callbacks})}}
  end

  @impl true
  def handle_cast({:remove_callback, name, callback}, %State{cells: cells} = state) do
    %OutputCell{callbacks: callbacks} = cell = cells[name]
    callbacks = Map.delete(callbacks, name)
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
