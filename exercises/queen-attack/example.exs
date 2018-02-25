defmodule Queens do
  @type t :: %Queens{white: {integer, integer}, black: {integer, integer}}
  defstruct white: {0, 3}, black: {7, 3}

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(same, same), do: raise(ArgumentError)

  def new(white, black) do
    %Queens{white: white, black: black}
  end

  def new, do: %Queens{}

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
