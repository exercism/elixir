defmodule TakeANumberDeluxe.State do
  defstruct min_number: 1, max_number: 999, queue: [], serving: []

  def new(min_number, max_number) do
    if is_integer(min_number) and is_integer(max_number) and min_number < max_number do
      {:ok, %__MODULE__{min_number: min_number, max_number: max_number}}
    else
      {:error, :invalid_configuration}
    end
  end

  def queue_new_number(%__MODULE__{} = state) do
    case find_next_available_number(state) do
      {:ok, next_available_number} ->
        {:ok, next_available_number, %{state | queue: [next_available_number | state.queue]}}

      {:error, error} ->
        {:error, error}
    end
  end

  def serve_next_queued_number(%__MODULE__{} = state) do
    case state.queue do
      [] ->
        {:error, :empty_queue}

      _ ->
        {next_queued_number, new_queue} = List.pop_at(state.queue, length(state.queue) - 1)

        {:ok, next_queued_number,
         %{state | queue: new_queue, serving: [next_queued_number | state.serving]}}
    end
  end

  def mark_number_as_served(%__MODULE__{} = state, number) do
    index = Enum.find_index(state.serving, &(&1 == number))

    if index == nil do
      {:error, :number_not_found}
    else
      {_, new_serving} = List.pop_at(state.serving, index)
      {:ok, %{state | serving: new_serving}}
    end
  end

  defp find_next_available_number(state) do
    all_numbers_in_use = state.queue ++ state.serving
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
