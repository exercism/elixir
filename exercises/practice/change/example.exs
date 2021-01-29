defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do
    coins |> Enum.sort(&>/2) |> generate(target, [], {:error, "cannot change"})
  end

  defp generate(_, _, current, {:ok, best}) when length(current) >= length(best) do
    {:ok, best}
  end

  defp generate(_, 0, current, _) do
    {:ok, current}
  end

  defp generate([], _, _, best) do
    best
  end

  defp generate([coin | coins], target, current, best) when coin > target do
    generate(coins, target, current, best)
  end

  defp generate([coin | coins], target, current, best) do
    first_try = generate([coin | coins], target - coin, [coin | current], best)
    generate(coins, target, current, first_try)
  end
end
