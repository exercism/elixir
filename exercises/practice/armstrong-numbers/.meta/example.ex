defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    exponent = length(digits)

    Enum.reduce(digits, 0, fn number, acc ->
      pow(number, exponent) + acc
    end) == number
  end

  defp pow(number, exponent) do
    # in Elixir 1.12 and above, could be:
    # Integer.pow(number, exponent)
    do_pow(number, exponent)
  end

  defp do_pow(number, 1), do: number

  defp do_pow(number, exponent) when is_integer(exponent) and exponent > 1 do
    number * pow(number, exponent - 1)
  end
end
