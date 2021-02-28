defmodule MatrixTest do
  use ExUnit.Case

  describe "row" do
    # @tag :pending
    test "extract row from one number matrix" do
      matrix = Matrix.from_string("1")
      assert Matrix.row(matrix, 1) == [1]
    end

    @tag :pending
    test "can extract row" do
      matrix = Matrix.from_string("1 2\n3 4")
      assert Matrix.row(matrix, 2) == [3, 4]
    end

    @tag :pending
    test "extract row where numbers have different widths" do
      matrix = Matrix.from_string("1 2\n10 20")
      assert Matrix.row(matrix, 2) == [10, 20]
    end

    @tag :pending
    test "can extract row from non-square matrix with no corresponding column" do
      matrix = Matrix.from_string("1 2 3\n4 5 6\n7 8 9\n8 7 6")
      assert Matrix.row(matrix, 4) == [8, 7, 6]
    end
  end

  describe "rows" do
    @tag :pending
    test "rows should return nested lists regardless of internal structure" do
      matrix = Matrix.from_string("1 2 3\n4 5 6\n7 8 9")

      assert Matrix.rows(matrix) == [
               [1, 2, 3],
               [4, 5, 6],
               [7, 8, 9]
             ]
    end
  end

  describe "column" do
    @tag :pending
    test "extract column from one number matrix" do
      matrix = Matrix.from_string("1")
      assert Matrix.column(matrix, 1) == [1]
    end

    @tag :pending
    test "can extract column" do
      matrix = Matrix.from_string("1 2 3\n4 5 6\n7 8 9")
      assert Matrix.column(matrix, 3) == [3, 6, 9]
    end

    @tag :pending
    test "can extract column from non-square matrix with no corresponding row" do
      matrix = Matrix.from_string("1 2 3 4\n5 6 7 8\n9 8 7 6")
      assert Matrix.column(matrix, 4) == [4, 8, 6]
    end

    @tag :pending
    test "extract column where numbers have different widths" do
      matrix = Matrix.from_string("89 1903 3\n18 3 1\n9 4 800")
      assert Matrix.column(matrix, 2) == [1903, 3, 4]
    end
  end

  describe "columns" do
    @tag :pending
    test "columns should return nested lists regardless of internal structure" do
      matrix = Matrix.from_string("1 2 3\n4 5 6\n7 8 9")

      assert Matrix.columns(matrix) == [
               [1, 4, 7],
               [2, 5, 8],
               [3, 6, 9]
             ]
    end
  end

  describe "to_string" do
    @tag :pending
    test "writing to string" do
      matrix = Matrix.from_string("1 2 3\n4 5 6\n7 8 9")
      assert Matrix.to_string(matrix) == "1 2 3\n4 5 6\n7 8 9"
    end
  end
end
