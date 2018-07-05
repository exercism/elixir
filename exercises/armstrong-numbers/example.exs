defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec is_valid?(integer) :: boolean
  def is_valid?(number) do
    digits = Integer.digits(number)
    exponent = length(digits)

    Enum.reduce(digits, 0, fn(number, acc) ->
      :math.pow(number, exponent) + acc
    end) == number
  end
end
