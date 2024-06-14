defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    do_rows(num - 1, [[1]])
  end

  defp do_rows(0, rows), do: Enum.reverse(rows)

  defp do_rows(n, rows = [h | _]) do
    do_rows(n - 1, [next_row(h) | rows])
  end

  defp next_row(list) do
    list
    |> each_cons
    |> Enum.map(fn [a, b] -> a + b end)
    |> add_ends
  end

  defp each_cons(list) do
    list
    |> Enum.flat_map(&[&1, &1])
    |> Enum.slice(1..-2//-1)
    |> Enum.chunk_every(2)
  end

  defp add_ends(list), do: [1] ++ list ++ [1]
end
