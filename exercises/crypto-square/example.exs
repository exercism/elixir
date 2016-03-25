defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(str) do
    letters = str |> normalize |> String.codepoints
    cols = letters |> length |> :math.sqrt |> Float.ceil |> trunc
    rest = letters 
           |> Enum.reverse
           |> Enum.slice(0, rem(length(letters), cols))
           |> Enum.reverse
    letters
    |> Enum.chunk(cols)
    |> Enum.concat([rest])
    |> zip
    |> Enum.join(" ")
  end

  defp normalize(str) do
    str
    |> String.downcase
    |> String.replace(~r/[^a-z0-9]/, "")
  end

  defp zip(rows) do
    0..length(Enum.at(rows, 0)) - 1
    |> Enum.reduce([], fn col_ind, acc ->
         rows
         |> get_col(col_ind)
         |> List.duplicate(1)
         |> Enum.concat(acc)
       end)
    |> Enum.reverse
  end

  defp get_col(rows, index) do
    Enum.reduce(rows, [], fn row, col ->
      if length(row) - 1 < index do
        col
      else
        [Enum.at(row, index) | col]
      end
    end) |> Enum.reverse
  end
end
