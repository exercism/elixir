defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t()
  def build_shape(letter) do
    pos = letter - 64
    size = pos * 2 - 1
    half = build_half_diamond(pos, size)
    Enum.join([half | Enum.slice(Enum.reverse(half), 1, length(half))])
  end

  defp build_half_diamond(rows, row_size) do
    Enum.reduce(0..(rows - 1), [], fn x, acc ->
      List.duplicate("\s", row_size)
      |> List.update_at(rows - 1 - x, fn _ -> <<65 + x>> end)
      |> Enum.reverse()
      |> List.update_at(rows - 1 - x, fn _ -> <<65 + x>> end)
      |> List.insert_at(row_size + 1, "\n")
      |> List.duplicate(1)
      |> Enum.concat(acc)
    end)
    |> Enum.reverse()
  end
end
