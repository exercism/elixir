defmodule PrimeFactors do
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    do_factors(number, 2, [])
  end

  defp do_factors(1, _, acc), do: Enum.reverse(acc)
  defp do_factors(n, i, acc) when n < i * i, do: Enum.reverse(acc, [n])
  defp do_factors(n, i, acc) when rem(n, i) == 0, do: do_factors(div(n, i), i, [i | acc])
  defp do_factors(n, i, acc), do: do_factors(n, i + 1, acc)
end
