defmodule Queens do
  @type t :: %Queens{white: {integer, integer}, black: {integer, integer}}
  defstruct [:white, :black]
  @board_range 0..7

  defguardp is_coordinate(c)
            when is_tuple(c) and tuple_size(c) == 2 and c |> elem(0) |> is_integer() and
                   c |> elem(1) |> is_integer()

  defguardp is_board_position(p)
            when is_coordinate(p) and p |> elem(0) |> Kernel.in(@board_range) and
                   p |> elem(1) |> Kernel.in(@board_range)

  @doc """
  Creates a new set of Queens
  """
  @spec new(Keyword.t()) :: Queens.t()
  def new(opts \\ []) do
    Enum.reduce(opts, %Queens{}, fn {queen, pos}, queens ->
      if not is_board_position(pos), do: raise(ArgumentError, "invalid board position")
      add_to_queens(queens, {queen, pos})
    end)
  end

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
  def can_attack?(%Queens{white: white, black: black})
      when is_nil(white) or is_nil(black),
      do: false

  def can_attack?(%Queens{white: white, black: black}) do
    {white_x, white_y} = white
    {black_x, black_y} = black
    white_x == black_x || white_y == black_y || diagonal?(white, black)
  end

  defp add_to_queens(queens, {queen, pos}) do
    case queen do
      :black ->
        if queens.white == pos, do: raise(ArgumentError, "white queen already placed here")

      :white ->
        if queens.black == pos, do: raise(ArgumentError, "black queen already placed here")

      _ ->
        raise(ArgumentError, "invalid queen color")
    end

    %{queens | queen => pos}
  end

  defp diagonal?({x1, y1}, {x2, y2}) do
    abs(x1 - x2) == abs(y1 - y2)
  end

  defp insert_queen(board, nil, _letter), do: board

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
