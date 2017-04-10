defmodule MatrixStruct do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `MatrixStruct` struct.
  """
  @spec from_string(input :: String.t()) :: %MatrixStruct{}
  def from_string(input) do
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %MatrixStruct{}) :: String.t()
  def to_string(matrix) do
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %MatrixStruct{}) :: list(list(integer))
  def rows(matrix) do
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %MatrixStruct{}, index :: integer) :: list(integer)
  def row(matrix, index) do
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %MatrixStruct{}) :: list(list(integer))
  def columns(matrix) do
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %MatrixStruct{}, index :: integer) :: list(integer)
  def column(matrix, index) do
  end
end

