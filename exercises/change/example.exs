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
  def generate(_amount, []), do: :error
  def generate(amount, values) do
    sorted_values = values |> Enum.sort
    reversed = sorted_values |> Enum.reverse

    case do_generate(amount, reversed, []) do
      :error -> :error
      chosen_coins -> {:ok, display(sorted_values, chosen_coins)}
    end
  end

  defp do_generate(0, [], coins), do: coins
  defp do_generate(_amount, [], _coins), do: :error
  defp do_generate(amount, [value|values], coins) do
    quantity = div(amount, value)
    amount_remaining = amount - (value * quantity)

    do_generate(amount_remaining, values, [quantity|coins])
  end

  defp display(values, chosen_coins) do
    [coins, _] = Enum.reduce(values, [%{}, 0], fn(value, [coins, index]) ->
      quantity = Enum.at(chosen_coins, index)
      [Map.put(coins, value, quantity), index + 1]
    end)

    coins
  end
end
