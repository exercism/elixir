import Bitwise

defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    do_count(number, 0)
  end

  defp do_count(0, acc), do: acc

  defp do_count(number, acc) when number > 0 do
    do_count(number >>> 1, acc + (number &&& 1))
  end
end
