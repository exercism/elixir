defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.reverse()
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(&do_checksum/1)
    |> Enum.sum()
  end

  defp do_checksum({digit, index}) do
    digit
    |> String.to_integer()
    |> double_if_even_index(index)
    |> compact
  end

  defp compact(num) when num < 10, do: num

  defp compact(num) do
    num
    |> Integer.digits()
    |> Enum.sum()
    |> compact
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number |> checksum |> rem(10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    number <> do_create(number)
  end

  defp do_create(number) do
    (number <> "0")
    |> checksum
    |> rem(10)
    |> (&(10 - &1)).()
    |> to_string
    |> String.last()
  end

  defp double_if_even_index(n, index) do
    if rem(index, 2) == 0, do: n, else: n * 2
  end
end
