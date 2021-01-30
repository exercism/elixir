defmodule Series do
  @spec digits(String.t()) :: [non_neg_integer]
  defp digits("") do
    []
  end

  defp digits(number_string) do
    String.split(number_string, "", trim: true)
    |> Enum.reduce([], fn char, acc -> [String.to_integer(char) | acc] end)
    |> Enum.reverse()
  end

  @spec slices(String.t(), non_neg_integer) :: [list(non_neg_integer)]
  defp slices(number_string, size) do
    digits = digits(number_string)
    chunk(digits, size, 1)
  end

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t(), non_neg_integer) :: non_neg_integer
  def largest_product(_, 0) do
    1
  end

  def largest_product(number_string, size) do
    unless Enum.member?(Range.new(0, String.length(number_string)), size) do
      raise ArgumentError
    end

    slices = slices(number_string, size)

    Enum.map(slices, &Enum.reduce(&1, fn x, acc -> x * acc end))
    |> Enum.max()
  end

  # Handle Enum.chunks -> Enum.chunk renaming.
  if {:chunk, 3} not in Enum.__info__(:functions) do
    defp chunk(coll, n, step), do: Enum.chunks(coll, n, step)
  else
    defp chunk(coll, n, step), do: Enum.chunk_every(coll, n, step, :discard)
  end
end
