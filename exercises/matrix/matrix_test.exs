if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("matrix.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(trace: true, exclude: :pending)

defmodule MatrixTest do
  use ExUnit.Case

  @input "1 2 3\n4 5 6\n7 8 9"

  # @tag :pending
  test "reading from and writing to string" do
    matrix = Matrix.from_string(@input)
    assert Matrix.to_string(matrix) == @input
  end

  @tag :pending
  test "rows should return nested lists regardless of internal structure" do
    matrix = Matrix.from_string(@input)

    assert Matrix.rows(matrix) == [
             [1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]
           ]
  end

  @tag :pending
  test "row should return list at index" do
    matrix = Matrix.from_string(@input)

    assert Matrix.row(matrix, 0) == [1, 2, 3]
    assert Matrix.row(matrix, 1) == [4, 5, 6]
    assert Matrix.row(matrix, 2) == [7, 8, 9]
  end

  @tag :pending
  test "columns should return nested lists regardless of internal structure" do
    matrix = Matrix.from_string(@input)

    assert Matrix.columns(matrix) == [
             [1, 4, 7],
             [2, 5, 8],
             [3, 6, 9]
           ]
  end

  @tag :pending
  test "column should return list at index" do
    matrix = Matrix.from_string(@input)

    assert Matrix.column(matrix, 0) == [1, 4, 7]
    assert Matrix.column(matrix, 1) == [2, 5, 8]
    assert Matrix.column(matrix, 2) == [3, 6, 9]
  end
end
