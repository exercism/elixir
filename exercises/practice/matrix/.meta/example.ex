defmodule Matrix do
  defstruct matrix: nil, transposed_matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    rows =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&parse_line/1)

    %Matrix{
      matrix: rows,
      transposed_matrix: rows |> List.zip() |> Enum.map(&Tuple.to_list/1)
    }
  end

  defp parse_line(input_line) do
    input_line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(%Matrix{matrix: rows}) do
    rows
    |> Enum.map(&join_row/1)
    |> Enum.join("\n")
  end

  defp join_row(row), do: Enum.join(row, " ")

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(%Matrix{matrix: rows}), do: rows

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(%Matrix{matrix: rows}, index), do: Enum.at(rows, index - 1)

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(%Matrix{transposed_matrix: cols}), do: cols

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(%Matrix{transposed_matrix: cols}, index), do: Enum.at(cols, index - 1)
end
