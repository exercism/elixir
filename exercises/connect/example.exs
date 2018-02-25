defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t()]) :: :none | :black | :white
  def result_for(board) do
    cond do
      black_wins?(board) -> :black
      white_wins?(board) -> :white
      true -> :none
    end
  end

  defp black_wins?(board) do
    board
    |> Enum.with_index()
    |> Enum.any?(fn {row, index} ->
      String.first(row) == "X" && black_wins?(board, [{index, 0}])
    end)
  end

  defp black_wins?(board, [{_, y} | _]) when y + 1 == byte_size(hd(board)), do: true

  defp black_wins?(board, history = [last_loc | _]) do
    last_loc
    |> locs_next_to(history)
    |> Enum.filter(&(get_loc(board, &1) == "X"))
    |> Enum.any?(&black_wins?(board, [&1 | history]))
  end

  defp white_wins?(board) do
    board
    |> hd
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.any?(fn {spot, index} ->
      spot == "O" && white_wins?(board, [{0, index}])
    end)
  end

  defp white_wins?(board, [{x, _} | _]) when x + 1 == length(board), do: true

  defp white_wins?(board, history = [last_loc | _]) do
    last_loc
    |> locs_next_to(history)
    |> Enum.filter(&(get_loc(board, &1) == "O"))
    |> Enum.any?(&white_wins?(board, [&1 | history]))
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
