defmodule Grains do
  use Bitwise, only_operators: true
  def square(number) when number in (1..64), do: 1 <<< (number - 1)
  def square(_), do: raise ArgumentError, message: "The requested square must be between 1 and 64 (inclusive )"
  def total, do: Enum.reduce(1..64, 0, fn(n, acc) -> acc + square(n) end)
end
