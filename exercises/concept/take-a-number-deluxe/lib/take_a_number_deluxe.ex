defmodule TakeANumberDeluxe do
  use GenServer

  # Client API

  def start_link(init_arg) do
    # Please implement the start_link/1 function
  end

  def report_state(machine) do
    # Please implement the report_state/1 function
  end

  def queue_new_number(machine) do
    # Please implement the queue_new_number/1 function
  end

  def serve_next_queued_number(machine, priority_number \\ nil) do
    # Please implement the serve_next_queued_number/2 function
  end

  def reset_state(machine) do
    # Please implement the reset_state/1 function
  end

  # Server callbacks

  # Please implement the necessary callbacks
end
