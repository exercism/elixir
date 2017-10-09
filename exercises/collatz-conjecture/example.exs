defmodule CollatzConjecture do
  @doc """
  calc/1 takes number (> 1), and returns the number of steps required to get to 1 when
  following the rules: if n is odd, multiply with 3 and add 1. if n is even, divide by 2
  """
  @spec calc(number :: pos_integer) :: pos_integer
  def calc(number) when number > 0 and is_integer(number) do
    calc(number, 0)
  end

  defp calc(1, steps), do: steps

  defp calc(number, steps) when rem(number, 2) == 0 do
    calc(div(number, 2), steps + 1)
  end

  defp calc(number, steps) do
    calc(number * 3 + 1, steps + 1)
  end
end
