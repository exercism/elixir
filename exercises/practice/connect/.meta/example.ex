defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  """
  @spec result_for([String.t()]) :: :none | :X | :O
  def result_for(board) do
    cond do
      x_wins?(board) -> :X
      o_wins?(board) -> :O
      true -> :none
    end
  end

  defp x_wins?(board) do
    board
    |> Enum.with_index()
    |> Enum.any?(fn {row, index} ->
      String.first(row) == "X" && x_wins?(board, [{index, 0}])
    end)
  end

  defp x_wins?(board, [{_, y} | _]) when y + 1 == byte_size(hd(board)), do: true

  defp x_wins?(board, history = [last_loc | _]) do
    last_loc
    |> locs_next_to(history)
    |> Enum.filter(&(get_loc(board, &1) == "X"))
    |> Enum.any?(&x_wins?(board, [&1 | history]))
  end

  defp o_wins?(board) do
    board
    |> hd
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.any?(fn {spot, index} ->
      spot == "O" && o_wins?(board, [{0, index}])
    end)
  end

  defp o_wins?(board, [{x, _} | _]) when x + 1 == length(board), do: true

  defp o_wins?(board, history = [last_loc | _]) do
    last_loc
    |> locs_next_to(history)
    |> Enum.filter(&(get_loc(board, &1) == "O"))
    |> Enum.any?(&o_wins?(board, [&1 | history]))
  end

  defp locs_next_to({x, y}, history) do
    [
      {x, y - 1},
      {x, y + 1},
      {x + 1, y},
      {x - 1, y},
      {x + 1, y - 1},
      {x - 1, y + 1}
    ]
    |> Enum.filter(&valid_next_loc(&1, history))
  end

  defp valid_next_loc({x, y}, history) do
    x >= 0 && y >= 0 && !({x, y} in history)
  end

  defp get_loc(board, {x, y}) do
    row = Enum.at(board, x)
    row && String.at(row, y)
  end
end
