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
    generate([[3, 4, 5]], sum)
    |> Enum.filter(&(Triplet.sum(&1) == sum))
    |> Enum.map(fn [a, b, c] -> [min(a, b), max(a, b), c] end)
    |> Enum.sort()
  end

  def generate([], _sum), do: []

  def generate([[a, b, c] = triple | triplets], sum) do
    next =
      triple
      |> next_triplets
      |> Enum.reject(&(Triplet.sum(&1) > sum))

    multiples =
      1..div(sum, 2 * c)
      |> Enum.map(fn n -> [n * a, n * b, n * c] end)

    multiples ++ generate(next ++ triplets, sum)
  end

  @doc """
  Given a primitive Pythagorean triple, generate three more.
  [All primitive Pythagorean triples can be generated this way without duplication][https://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples].
  """
  def next_triplets([a, b, c]),
    do: [
      [a - 2 * b + 2 * c, 2 * a - b + 2 * c, 2 * a - 2 * b + 3 * c],
      [a + 2 * b + 2 * c, 2 * a + b + 2 * c, 2 * a + 2 * b + 3 * c],
      [-a + 2 * b + 2 * c, -2 * a + b + 2 * c, -2 * a + 2 * b + 3 * c]
    ]
end
