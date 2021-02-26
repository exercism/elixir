defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_row/1)
  end

  defp parse_row(str) do
    str
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)
    columns = columns(str)

    rows
    |> generate_coordinates
    |> Enum.filter(&is_saddle_point?(&1, rows, columns))
    |> Enum.map(fn {x, y} -> {x + 1, y + 1} end)
  end

  defp is_saddle_point?(point, rows, columns) do
    max_in_row?(point, rows) && min_in_column?(point, columns)
  end

  defp max_in_row?({x, y}, rows) do
    row = Enum.at(rows, x)
    Enum.at(row, y) == Enum.max(row)
  end

  defp min_in_column?({x, y}, columns) do
    column = Enum.at(columns, y)
    Enum.at(column, x) == Enum.min(column)
  end

  defp generate_coordinates(rows) do
    rows
    |> Enum.with_index()
    |> Enum.flat_map(&generate_coordinates_row/1)
  end

  defp generate_coordinates_row({row, row_index}) do
    row
    |> Enum.with_index()
    |> Enum.map(fn {_, col_index} -> {row_index, col_index} end)
  end
end
