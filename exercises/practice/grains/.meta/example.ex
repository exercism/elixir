defmodule Grains do
  import Bitwise
  def square(number) when number in 1..64, do: {:ok, 1 <<< (number - 1)}
  def square(_), do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  def total,
    do:
      {:ok,
       Enum.reduce(1..64, 0, fn n, acc ->
         {:ok, sq} = square(n)
         acc + sq
       end)}
end
