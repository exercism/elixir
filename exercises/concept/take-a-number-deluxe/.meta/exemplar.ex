defmodule TakeANumberDeluxe do
  use GenServer

  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  def queue_new_number(machine) do
    GenServer.call(machine, :queue_new_number)
  end

  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_queued_number, priority_number})
  end

  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  # Server callbacks

  @impl GenServer
  def init(init_arg) do
    min_number = Keyword.get(init_arg, :min_number)
    max_number = Keyword.get(init_arg, :max_number)

    case TakeANumberDeluxe.State.new(min_number, max_number) do
      {:ok, state} -> {:ok, state}
      {:error, error} -> {:stop, error}
    end
  end

  @impl GenServer
  def handle_call(:report_state, _from, state) do
    {:reply, state, state}
  end

  @impl GenServer
  def handle_call(:queue_new_number, _from, state) do
    case TakeANumberDeluxe.State.queue_new_number(state) do
      {:ok, new_number, new_state} ->
        {:reply, {:ok, new_number}, new_state}

      {:error, error} ->
        {:reply, {:error, error}, state}
    end
  end

  @impl GenServer
  def handle_call({:serve_next_queued_number, priority_number}, _from, state) do
    case TakeANumberDeluxe.State.serve_next_queued_number(state, priority_number) do
      {:ok, next_number, new_state} ->
        {:reply, {:ok, next_number}, new_state}

      {:error, error} ->
        {:reply, {:error, error}, state}
    end
  end

  @impl GenServer
  def handle_cast(:reset_state, state) do
    {:ok, state} = TakeANumberDeluxe.State.new(state.min_number, state.max_number)
    {:noreply, state}
  end

  @impl GenServer
  def handle_info({:take_a_number, sender_pid}, state) do
    send(sender_pid, {:error, :basic_model_message_received_by_deluxe_model_server})
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(_, state) do
    {:noreply, state}
  end
end