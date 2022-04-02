defmodule TakeANumberDeluxe.State do
  defstruct min_number: 1, max_number: 999, queue: nil, auto_shutdown_timeout: :infinity
  @type t :: %__MODULE__{}

  @spec new(integer, integer, timeout) :: {:ok, TakeANumberDeluxe.State.t()} | {:error, atom()}
  def new(min_number, max_number, auto_shutdown_timeout \\ :infinity) do
    if min_and_max_numbers_valid?(min_number, max_number) and
         timeout_valid?(auto_shutdown_timeout) do
      {:ok,
       %__MODULE__{
         min_number: min_number,
         max_number: max_number,
         queue: :queue.new(),
         auto_shutdown_timeout: auto_shutdown_timeout
       }}
    else
      {:error, :invalid_configuration}
    end
  end

  @spec queue_new_number(TakeANumberDeluxe.State.t()) ::
          {:ok, integer(), TakeANumberDeluxe.State.t()} | {:error, atom()}
  def queue_new_number(%__MODULE__{} = state) do
    case find_next_available_number(state) do
      {:ok, next_available_number} ->
        {:ok, next_available_number,
         %{state | queue: :queue.in(next_available_number, state.queue)}}

      {:error, error} ->
        {:error, error}
    end
  end

  @spec serve_next_queued_number(TakeANumberDeluxe.State.t(), integer() | nil) ::
          {:ok, integer(), TakeANumberDeluxe.State.t()} | {:error, atom()}
  def serve_next_queued_number(%__MODULE__{} = state, priority_number) do
    cond do
      :queue.is_empty(state.queue) ->
        {:error, :empty_queue}

      is_nil(priority_number) ->
        {{:value, next_number}, new_queue} = :queue.out(state.queue)
        {:ok, next_number, %{state | queue: new_queue}}

      :queue.member(priority_number, state.queue) ->
        {:ok, priority_number, %{state | queue: :queue.delete(priority_number, state.queue)}}

      true ->
        {:error, :priority_number_not_found}
    end
  end

  defp min_and_max_numbers_valid?(min_number, max_number) do
    is_integer(min_number) and is_integer(max_number) and min_number < max_number
  end

  defp timeout_valid?(timeout) do
    timeout == :infinity || (is_integer(timeout) && timeout >= 0)
  end

  defp find_next_available_number(state) do
    all_numbers_in_use = :queue.to_list(state.queue)
    all_numbers = Enum.to_list(state.min_number..state.max_number)

    case all_numbers_in_use do
      [] ->
        {:ok, state.min_number}

      list when length(list) == length(all_numbers) ->
        {:error, :all_possible_numbers_are_in_use}

      _ ->
        current_highest_number = Enum.max(all_numbers_in_use)

        next_available_number =
          if current_highest_number < state.max_number do
            current_highest_number + 1
          else
            Enum.min(all_numbers -- all_numbers_in_use)
          end

        {:ok, next_available_number}
    end
  end
end
