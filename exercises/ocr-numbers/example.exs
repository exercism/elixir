defmodule OCRNumbers do
  @doc """
  Given a 3 x 4 grid of pipes, underscores, and spaces, determine which number is represented, or
  whether it is garbled.
  """
  @spec convert([String.t()]) :: String.t()
  def convert(input) do
    Enum.chunk(input, 4)
    |> Enum.map(fn row_set -> _convert(row_set, "") end)
    |> format_output()
  end

  def format_output([]), do: {:error, 'invalid line count'}
  def format_output(rows), do: _format_output(Enum.any?(rows, &_error?/1), rows)
  def _format_output(true, rows), do: Enum.find(rows, &_error?/1)
  def _format_output(false, output), do: {:ok, Enum.join(output, ",")}
  def _error?({:error, _}), do: true
  def _error?(_), do: false

  def _convert(_, {:error, _} = error), do: error
  def _convert(input, _) when length(input) != 4, do: {:error, 'invalid line count'}
  def _convert(["", "", "", ""], output), do: output

  def _convert(input, output) do
    split_strings = Enum.map(input, fn a -> String.split_at(a, 3) end)
    this_character = Enum.map(split_strings, fn {a, _} -> a end)
    other_characters = Enum.map(split_strings, fn {_, a} -> a end)
    lengths = Enum.map(this_character, fn a -> String.length(a) end)

    _convert(other_characters, update_output(lengths, this_character, output))
  end

  def update_output([3, 3, 3, 3], chars, output), do: output <> recognize_character(chars)
  def update_output(_, _, _), do: {:error, 'invalid column count'}

  def recognize_character([" _ ", "| |", "|_|", "   "]), do: "0"
  def recognize_character(["   ", "  |", "  |", "   "]), do: "1"
  def recognize_character([" _ ", " _|", "|_ ", "   "]), do: "2"
  def recognize_character([" _ ", " _|", " _|", "   "]), do: "3"
  def recognize_character(["   ", "|_|", "  |", "   "]), do: "4"
  def recognize_character([" _ ", "|_ ", " _|", "   "]), do: "5"
  def recognize_character([" _ ", "|_ ", "|_|", "   "]), do: "6"
  def recognize_character([" _ ", "  |", "  |", "   "]), do: "7"
  def recognize_character([" _ ", "|_|", "|_|", "   "]), do: "8"
  def recognize_character([" _ ", "|_|", " _|", "   "]), do: "9"
  def recognize_character(_), do: "?"
end
