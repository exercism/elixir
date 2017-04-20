defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    width = (letter - ?A) * 2 + 1
    top = build_half_diamond(width)
    bottom = Enum.slice(top, 0..-2) |> Enum.reverse
    Enum.join(top ++ bottom, "\n")
  end

  @spec build_half_diamond(integer) :: [String.t]
  defp build_half_diamond(width) do
    Range.new(0, div(width, 2))
    |> Enum.map(&build_row(width, &1, <<?A + &1>>))
  end

  @spec build_row(integer, integer, String.t) :: String.t
  defp build_row(width, level, letter) do
    middle = div(width, 2)
    List.duplicate(" ", width)
    |> List.replace_at(middle - level, letter)
    |> List.replace_at(middle + level, letter)
    |> Enum.join
  end
end
