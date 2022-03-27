defmodule TakeANumberDeluxe.State do
  defstruct min_number: 1, max_number: 999, queue: []
  @type t :: %__MODULE__{}

  @spec new(integer, integer) :: {:ok, TakeANumberDeluxe.State.t()} | {:error, :atom}
  def new(min_number, max_number) do
    if is_integer(min_number) and is_integer(max_number) and min_number < max_number do
      {:ok, %__MODULE__{min_number: min_number, max_number: max_number}}
    else
      {:error, :invalid_configuration}
    end
  end

  @spec queue_new_number(TakeANumberDeluxe.State.t()) ::
          {:ok, TakeANumberDeluxe.State.t()} | {:error, :atom}
  def queue_new_number(%__MODULE__{} = state) do
    case find_next_available_number(state) do
      {:ok, next_available_number} ->
        {:ok, next_available_number, %{state | queue: [next_available_number | state.queue]}}

      {:error, error} ->
        {:error, error}
    end
  end

  @spec serve_next_queued_number(TakeANumberDeluxe.State.t(), integer) ::
          {:ok, TakeANumberDeluxe.State.t()} | {:error, :atom}
  def serve_next_queued_number(%__MODULE__{} = state, priority_number) do
    priority_number_index = Enum.find_index(state.queue, &(&1 == priority_number))

    cond do
      state.queue == [] ->
        {:error, :empty_queue}

      priority_number != nil && priority_number_index == nil ->
        {:error, :priority_number_not_found}

      true ->
        next_queued_number_index = priority_number_index || length(state.queue) - 1
        {next_queued_number, new_queue} = List.pop_at(state.queue, next_queued_number_index)
        {:ok, next_queued_number, %{state | queue: new_queue}}
    end
  end

  defp find_next_available_number(state) do
    all_numbers_in_use = state.queue
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
