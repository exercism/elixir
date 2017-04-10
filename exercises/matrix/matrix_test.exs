if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("matrix.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true, exclude: :pending

defmodule MatrixTest do
  use ExUnit.Case

  @input "1 2 3\n4 5 6\n7 8 9"

  #@tag :pending
  test "reading from and writing to string" do
    matrix = MatrixStruct.from_string(@input)

    assert matrix != nil

    %MatrixStruct{ matrix: parsed_matrix } = matrix

    # You can represent the internal structure however you want
    assert parsed_matrix != nil

    assert MatrixStruct.to_string(matrix) == @input
  end

  @tag :pending
  test "rows should return nested lists regardless of internal structure" do
    matrix = MatrixStruct.from_string(@input)

    assert MatrixStruct.rows(matrix) == [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  @tag :pending
  test "row should return list at index" do
    matrix = MatrixStruct.from_string(@input)

    assert MatrixStruct.row(matrix, 0) == [1, 2, 3]
    assert MatrixStruct.row(matrix, 1) == [4, 5, 6]
    assert MatrixStruct.row(matrix, 2) == [7, 8, 9]
  end

  @tag :pending
  test "columns should return nested lists regardless of internal structure" do
    matrix = MatrixStruct.from_string(@input)

    assert MatrixStruct.columns(matrix) == [
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9]
    ]
  end

  @tag :pending
  test "column should return list at index" do
    matrix = MatrixStruct.from_string(@input)

    assert MatrixStruct.column(matrix, 0) == [1, 4, 7]
    assert MatrixStruct.column(matrix, 1) == [2, 5, 8]
    assert MatrixStruct.column(matrix, 2) == [3, 6, 9]
  end
end
