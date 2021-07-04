defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value([], _maximum_weight), do: 0

  def maximum_value([%{weight: weight} | items], maximum_weight) when weight > maximum_weight,
    do: maximum_value(items, maximum_weight)

  def maximum_value([%{value: value, weight: weight} | items], maximum_weight) do
    max(
      maximum_value(items, maximum_weight),
      maximum_value(items, maximum_weight - weight) + value
    )
  end
end
