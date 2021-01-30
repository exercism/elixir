defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """
  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(0), do: []

  def matrix(dimension) do
    unwind(dimension, dimension, 1)
  end

  defp unwind(row, col, start) do
    case col do
      0 ->
        [[]]

      _ ->
        [
          Enum.to_list(start..(start + col - 1))
          | unwind(col, row - 1, start + col) |> rotate_right
        ]
    end
  end

  defp rotate_right(matrix) do
    matrix |> transpose |> Enum.map(&Enum.reverse/1)
  end

  defp transpose(matrix) do
    matrix |> List.zip() |> Enum.map(&Tuple.to_list/1)
  end
end
