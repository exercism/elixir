defmodule PalindromeProducts do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1)
  def generate(max_factor, min_factor) when min_factor > max_factor, do: raise(ArgumentError)

  def generate(max_factor, min_factor) do
    palindromes(max_factor, min_factor)
    |> Enum.reverse()
    |> Enum.group_by(fn [f1, f2] -> f1 * f2 end)
  end

  defp palindromes(max_factor, min_factor) do
    for f1 <- min_factor..max_factor,
        f2 <- f1..max_factor,
        palindrome?(f1 * f2),
        do: [f1, f2]
  end

  defp palindrome?(n) do
    list = Integer.digits(n)
    list == Enum.reverse(list)
  end
end
