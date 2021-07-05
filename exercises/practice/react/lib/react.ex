defmodule React do
  defmodule InputCell do
    defstruct [:name, :value]
    @type t :: %InputCell{name: String.t(), value: any}
  end

  defmodule OutputCell do
    defstruct [:name, :inputs, :compute, :value, :callbacks]

    @type t :: %OutputCell{
            name: String.t(),
            inputs: [String.t()],
            compute: (... -> any),
            value: any,
            callbacks: [String.t()]
          }
  end

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [InputCell.t() | OutputCell.t()]) :: {:ok, pid}
  def new(cells) do
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(cells :: pid, cell :: String.t()) :: any()
  def get_value(cells, cell) do
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(cells :: pid, cell :: String.t(), value :: any) :: %{String.t() => any}
  def set_value(cells, cell, value) do
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(cells :: pid, cell :: String.t(), callback :: String.t()) :: :ok
  def add_callback(cells, cell, callback) do
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell :: String.t(), callback :: String.t()) :: :ok
  def remove_callback(cells, cell, callback) do
  end
end
