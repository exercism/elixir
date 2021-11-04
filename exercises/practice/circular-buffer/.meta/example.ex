defmodule CircularBuffer do
  use GenServer

  @moduledoc """
  An API to a stateful process that fills and empties a circular buffer
  """

  # CLIENT API

  @doc """
  Create a new buffer of a given capacity
  """
  @spec new(capacity :: integer) :: {:ok, pid}
  def new(capacity) do
    GenServer.start_link(__MODULE__, capacity, [])
  end

  @doc """
  Read the oldest entry in the buffer, fail if it is empty
  """
  @spec read(buffer :: pid) :: {:ok, any} | {:error, atom}
  def read(buffer) do
    GenServer.call(buffer, :read)
  end

  @doc """
  Write a new item in the buffer, fail if is full
  """
  @spec write(buffer :: pid, item :: any) :: :ok | {:error, atom}
  def write(buffer, item) do
    GenServer.call(buffer, {:write, item})
  end

  @doc """
  Write an item in the buffer, overwrite the oldest entry if it is full
  """
  @spec overwrite(buffer :: pid, item :: any) :: :ok
  def overwrite(buffer, item) do
    GenServer.cast(buffer, {:overwrite, item})
  end

  @doc """
  Clear the buffer
  """
  @spec clear(buffer :: pid) :: :ok
  def clear(buffer) do
    GenServer.cast(buffer, :clear)
  end

  # DATA STRUCTURE
  # Essentially a deque made out of two lists, one for new input (write, overwrite)
  # and one for output (read), and keeping track of the size and capacity.

  defstruct [:capacity, size: 0, input: [], output: []]

  defp new_buffer(capacity), do: {:ok, %CircularBuffer{capacity: capacity}}

  defp read_buffer(%CircularBuffer{size: 0} = buffer), do: {{:error, :empty}, buffer}

  defp read_buffer(%CircularBuffer{size: size, output: [out | output]} = buffer),
    do: {{:ok, out}, %{buffer | size: size - 1, output: output}}

  defp read_buffer(%CircularBuffer{input: input} = buffer),
    do: read_buffer(%{buffer | input: [], output: Enum.reverse(input)})

  defp write_buffer(%CircularBuffer{size: capacity, capacity: capacity} = buffer, _item),
    do: {{:error, :full}, buffer}

  defp write_buffer(%CircularBuffer{size: size, input: input} = buffer, item),
    do: {:ok, %{buffer | size: size + 1, input: [item | input]}}

  defp overwrite_buffer(%CircularBuffer{size: capacity, capacity: capacity} = buffer, item) do
    {_, smaller_buffer} = read_buffer(buffer)
    write_buffer(smaller_buffer, item)
  end

  defp overwrite_buffer(buffer, item), do: write_buffer(buffer, item)

  defp clear_buffer(%CircularBuffer{capacity: capacity}), do: %CircularBuffer{capacity: capacity}

  # SERVER API

  @impl true
  def init(capacity) do
    new_buffer(capacity)
  end

  @impl true
  def handle_call(:read, _from, buffer) do
    {reply, buffer} = read_buffer(buffer)
    {:reply, reply, buffer}
  end

  @impl true
  def handle_call({:write, item}, _from, buffer) do
    {reply, buffer} = write_buffer(buffer, item)
    {:reply, reply, buffer}
  end

  @impl true
  def handle_cast({:overwrite, item}, buffer) do
    {_reply, buffer} = overwrite_buffer(buffer, item)
    {:noreply, buffer}
  end

  @impl true
  def handle_cast(:clear, buffer) do
    {:noreply, clear_buffer(buffer)}
  end
end
