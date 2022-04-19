defmodule KillerSudokuHelper do
  @doc """
  Return the possible combinations of `size` distinct numbers from 1-9 excluding `exclude` that sum up to `sum`.
  """
  @spec combinations(cage :: %{exclude: [integer], size: integer, sum: integer}) :: [[integer]]
  def combinations(%{exclude: exclude, size: size, sum: sum}) do
    numbers = [9, 8, 7, 6, 5, 4, 3, 2, 1] -- exclude

    do_combinations(numbers, size, [[]])
    |> Enum.filter(&(Enum.sum(&1) == sum))
  end

  defp do_combinations(_numbers, 0, list), do: list

  defp do_combinations(numbers, size, list) do
    numbers
    |> tails()
    |> Enum.map(fn [head | tail] ->
      do_combinations(tail, size - 1, Enum.map(list, &[head | &1]))
    end)
    |> Enum.concat()
  end

  defp tails([]), do: []
  defp tails([_ | tail] = list), do: [list | tails(tail)]
end
