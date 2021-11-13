defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples

    iex> Transpose.transpose("ABC\\nDE")
    "AD\\nBE\\nC"

    iex> Transpose.transpose("AB\\nDEF")
    "AD\\nBE\\n F"
  """

  @spec transpose(String.t()) :: String.t()
  def transpose(matrix) do
    rows = String.split(matrix, "\n")

    max_length = get_longest_row_length(rows)

    rows
    |> Enum.map(fn x -> get_padded_row(x, max_length) end)
    |> Enum.map(&String.to_charlist/1)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&List.to_string/1)
    |> Enum.map(fn x -> x |> String.trim_trailing("*") |> String.replace("*", " ") end)
    |> Enum.join("\n")
    |> String.trim_trailing()
  end

  defp get_longest_row_length(rows) do
    rows
    |> Enum.map(&String.length/1)
    |> Enum.max()
  end

  defp get_padded_row(row, max_length) do
    padding = String.duplicate("*", max_length - String.length(row))
    row <> padding
  end
end
