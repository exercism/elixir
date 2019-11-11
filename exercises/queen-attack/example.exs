defmodule Queens do
  @type t :: %Queens{white: {integer, integer}, black: {integer, integer}}
  defstruct [:white, :black]
  @board_range 0..7

  @doc """
  Creates a new set of Queens
  """
  @spec new(Keyword.t()) :: Queens.t()
  def new(opts \\ []), do: do_new(%Queens{}, opts)

  defp do_new([{queen, pos} | rest], queens) do
    if not is_valid_position?(pos), do: raise(ArgumentError)
    do_new(rest, add_to_queens(queens, {queen, pos}))
  end

  defp do_new([], queens), do: queens

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{white: white, black: black}) do
    generate_board()
    |> insert_queen(white, "W")
    |> insert_queen(black, "B")
    |> Enum.map(&Enum.join(&1, " "))
    |> Enum.join("\n")
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: white, black: black}) do
    {white_x, white_y} = white
    {black_x, black_y} = black
    white_x == black_x || white_y == black_y || diagonal?(white, black)
  end

  defp is_valid_position?({x, y}) do
    x in @board_range && y in @board_range
  end

  defp add_to_queens(queens, {queen, pos}) do
    if pos in Map.values(queens), do: raise(ArgumentError)
    %{queens | queen => pos}
  end

  defp diagonal?({x1, y1}, {x2, y2}) do
    abs(x1 - x2) == abs(y1 - y2)
  end

  defp insert_queen(board, {x, y}, letter) do
    List.update_at(board, x, fn row ->
      List.replace_at(row, y, letter)
    end)
  end

  defp generate_board do
    "_"
    |> List.duplicate(8)
    |> List.duplicate(8)
  end
end
