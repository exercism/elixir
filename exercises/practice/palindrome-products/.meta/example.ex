defmodule Palindromes do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer) :: map
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    Enum.reduce(min_factor..max_factor, %{}, fn x, map ->
      Enum.reduce(x..max_factor, map, fn y, products ->
        if palindrome?(x * y), do: add_factor(products, x, y), else: products
      end)
    end)
  end

  defp palindrome?(number) do
    String.reverse(to_string(number)) == to_string(number)
  end

  defp add_factor(map, x, y) do
    product = x * y
    Map.update(map, product, [[x, y]], fn val -> Enum.concat(val, [[x, y]]) end)
  end
end
