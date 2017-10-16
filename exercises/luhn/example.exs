defmodule Luhn do

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do

    with  number       <- String.replace(number, " ", ""),
          {_, ""}      <- Integer.parse(number),
          true         <- String.length(number) > 1,
          true         <- checksum(number)
    do
      true
    else
      _ -> false
    end
  end

  defp checksum(number) do
    0 == number
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> double_even()
    |> Enum.sum()
    |> rem(10)
  end

  defp double_even(numlist) do
    numlist
    |> Enum.reverse()
    |> Enum.zip(Stream.cycle([1,2]))
    |> Enum.map(fn {n,m} -> n * m  end)
    |> Enum.map(
      fn
        n when n > 9 -> n-9
        n -> n
      end)

  end

  
end
  