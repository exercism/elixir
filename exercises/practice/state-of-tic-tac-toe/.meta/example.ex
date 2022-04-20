defmodule StateOfTicTacToe do
  @rows [[{0, 0}, {0, 1}, {0, 2}], [{1, 0}, {1, 1}, {1, 2}], [{2, 0}, {2, 1}, {2, 2}]]
  @columns [[{0, 0}, {1, 0}, {2, 0}], [{0, 1}, {1, 1}, {2, 1}], [{0, 2}, {1, 2}, {2, 2}]]
  @diagonals [[{0, 0}, {1, 1}, {2, 2}], [{0, 2}, {1, 1}, {2, 0}]]

  @doc """
  Determine the state a game of tic-tac-toe where X starts.
  """
  @spec game_state(board :: String.t()) :: {:ok, :win | :ongoing | :draw} | {:error, String.t()}
  def game_state(board) do
    board =
      for {line, row} <- board |> String.split("\n", trim: true) |> Enum.with_index(),
          {player, col} <- line |> to_charlist() |> Enum.with_index(),
          into: %{} do
        {{row, col}, player}
      end

    x_count = Enum.count(board, fn {_, c} -> c == ?X end)
    o_count = Enum.count(board, fn {_, c} -> c == ?O end)

    x_wins = wins?(board, ?X)
    o_wins = wins?(board, ?O)

    cond do
      x_count - o_count > 1 ->
        {:error, "Wrong turn order: X went twice"}

      o_count - x_count > 0 ->
        {:error, "Wrong turn order: O started"}

      x_wins and o_wins ->
        {:error, "Impossible board: game should have ended after the game was won"}

      x_wins or o_wins ->
        {:ok, :win}

      o_count == 4 ->
        {:ok, :draw}

      true ->
        {:ok, :ongoing}
    end
  end

  defp wins?(board, player) do
    Enum.any?(
      @rows ++ @columns ++ @diagonals,
      fn cells -> Enum.all?(cells, fn cell -> board[cell] == player end) end
    )
  end
end
