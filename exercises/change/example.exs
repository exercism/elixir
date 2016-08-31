defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    values |> Enum.sort(&(&2 < &1)) |> generate(amount, %{})
  end

  defp generate(_, 0, acc), do: {:ok, acc}
  defp generate([], _, _), do: :error
  defp generate(values = [h | t], amount, acc) do
    if amount >= h && divisible?(amount - h, values) do
      generate(values, amount - h, Map.update(acc, h, 1, &(&1 + 1)))
    else
      generate(t, amount, Map.put_new(acc, h, 0))
    end
  end

  defp divisible?(num, values) do
    Enum.any?(values, &(rem(num, &1) == 0))
  end
end
