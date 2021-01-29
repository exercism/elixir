defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    {:ok, number |> aliquot_sum |> do_classify(number)}
  end

  defp do_classify(aliquot, aliquot), do: :perfect
  defp do_classify(aliquot, number) when aliquot > number, do: :abundant
  defp do_classify(_, _), do: :deficient

  defp aliquot_sum(number) do
    number
    |> factors
    |> Enum.reject(&(&1 == number))
    |> Enum.sum()
  end

  defp factors(number), do: factors(number, div(number, 2))
  defp factors(1, _), do: [1]
  defp factors(_, 1), do: [1]
  defp factors(number, i) when rem(number, i) == 0, do: [i | factors(number, i - 1)]
  defp factors(number, i), do: factors(number, i - 1)
end
