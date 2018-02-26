defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number_without_spaces = String.replace(number, " ", "")

    case Integer.parse(number_without_spaces) do
      {_, ""} ->
        String.length(number_without_spaces) > 1 && checksum(number_without_spaces)

      _ ->
        false
    end
  end

  defp checksum(number) do
    0 ==
      number
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
      |> double_even()
      |> Enum.sum()
      |> rem(10)
  end

  defp double_even(numlist) do
    numlist
    |> Enum.reverse()
    |> Enum.zip(Stream.cycle([1, 2]))
    |> Enum.map(fn {n, m} -> n * m end)
    |> Enum.map(fn
      n when n > 9 -> n - 9
      n -> n
    end)
  end
end
