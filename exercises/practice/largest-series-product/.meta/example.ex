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
    Enum.chunk_every(digits, size, 1, :discard)
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

    number_string
    |> slices(size)
    |> Enum.map(fn integers -> Enum.reduce(integers, &*/2) end)
    |> Enum.max()
  end
end
