defmodule OcrNumbers do
  @doc """
  Given a 3 x 4 grid of pipes, underscores, and spaces, determine which number is represented, or
  whether it is garbled.
  """
  @spec convert([String.t()]) :: {:ok, String.t()} | {:error, String.t()}
  def convert(input) do
    Enum.chunk_every(input, 4)
    |> Enum.map(fn row_set -> convert(row_set, "") end)
    |> format_output()
  end

  defp format_output([]), do: {:error, "invalid line count"}
  defp format_output(rows), do: format_output(Enum.any?(rows, &error?/1), rows)
  defp format_output(true, rows), do: Enum.find(rows, &error?/1)
  defp format_output(false, output), do: {:ok, Enum.join(output, ",")}

  defp error?({:error, _}), do: true
  defp error?(_), do: false

  defp convert(_, {:error, _} = error), do: error
  defp convert(input, _) when length(input) != 4, do: {:error, "invalid line count"}
  defp convert(["", "", "", ""], output), do: output

  defp convert(input, output) do
    split_strings = Enum.map(input, fn a -> String.split_at(a, 3) end)
    this_character = Enum.map(split_strings, fn {a, _} -> a end)
    other_characters = Enum.map(split_strings, fn {_, a} -> a end)
    lengths = Enum.map(this_character, &String.length/1)

    convert(other_characters, update_output(lengths, this_character, output))
  end

  defp update_output([3, 3, 3, 3], chars, output), do: output <> recognize_character(chars)
  defp update_output(_, _, _), do: {:error, "invalid column count"}

  defp recognize_character([" _ ", "| |", "|_|", "   "]), do: "0"
  defp recognize_character(["   ", "  |", "  |", "   "]), do: "1"
  defp recognize_character([" _ ", " _|", "|_ ", "   "]), do: "2"
  defp recognize_character([" _ ", " _|", " _|", "   "]), do: "3"
  defp recognize_character(["   ", "|_|", "  |", "   "]), do: "4"
  defp recognize_character([" _ ", "|_ ", " _|", "   "]), do: "5"
  defp recognize_character([" _ ", "|_ ", "|_|", "   "]), do: "6"
  defp recognize_character([" _ ", "  |", "  |", "   "]), do: "7"
  defp recognize_character([" _ ", "|_|", "|_|", "   "]), do: "8"
  defp recognize_character([" _ ", "|_|", " _|", "   "]), do: "9"
  defp recognize_character(_), do: "?"
end
