defmodule Triplet do
  @doc """
  Calculates sum of a given triplet of integers.
  """
  @spec sum([non_neg_integer]) :: non_neg_integer
  def sum(triplet) do
    Enum.reduce(triplet, 0, &(&1 + &2))
  end

  @doc """
  Calculates product of a given triplet of integers.
  """
  @spec product([non_neg_integer]) :: non_neg_integer
  def product(triplet) do
    Enum.reduce(triplet, 1, &(&1 * &2))
  end

  @doc """
  Determines if a given triplet is pythagorean. That is, do the squares of a and b add up to the square of c?
  """
  @spec pythagorean?([non_neg_integer]) :: boolean
  def pythagorean?([a, b, c]) do
    a * a + b * b == c * c
  end

  @doc """
  Generates a list of pythagorean triplets whose values add up to a given sum.
  """
  @spec generate(non_neg_integer) :: [list(non_neg_integer)]
  def generate(sum) do
    Enum.map(sum..1, fn x ->
      Task.async(fn ->
        for y <- if(sum - 2 * x > x, do: Enum.to_list(x..(sum - 2 * x)), else: []),
            z <- if(sum - x - y != 0, do: [sum - x - y], else: []),
            pythagorean?([x, y, z]),
            do: [x, y, z]
      end)
    end)
    |> Task.await_many()
    |> Enum.reduce([], fn list, acc -> list ++ acc end)
  end
end
