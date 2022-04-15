defmodule StateOfTicTacToe do
  @doc """
  Determine the state a game of tic-tac-toe where X starts.
  """
  @spec gamestate(board :: String.t()) :: {:ok, :win | :ongoing | :draw} | {:error, String.t()}
  def gamestate(board) do
  end
end
