defmodule RomanNumerals do
  @numerals [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  def numeral(0), do: ""

  def numeral(number) do
    [part, letter] = largest_factor(number)
    letter <> numeral(number - part)
  end

  defp largest_factor(number) do
    hd(Enum.filter(@numerals, fn [p, _] -> p <= number end))
  end
end
