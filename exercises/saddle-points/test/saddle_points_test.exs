defmodule SaddlePointsTest do
  use ExUnit.Case

  # @tag :pending
  test "extract rows" do
    rows = SaddlePoints.rows("1 2\n10 20")
    assert rows == [[1, 2], [10, 20]]
  end

  @tag :pending
  test "extract a row" do
    rows = SaddlePoints.rows("9 7\n8 6")
    assert Enum.at(rows, 0) == [9, 7]
  end

  @tag :pending
  test "extract other row" do
    rows = SaddlePoints.rows("9 8 7\n19 18 17")
    assert Enum.at(rows, 1) == [19, 18, 17]
  end

  @tag :pending
  test "extract other row again" do
    rows = SaddlePoints.rows("1 4 9\n16 25 36")
    assert Enum.at(rows, 1) == [16, 25, 36]
  end

  @tag :pending
  test "extract a column" do
    columns = SaddlePoints.columns("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    assert Enum.at(columns, 0) == [1, 4, 7, 8]
  end

  @tag :pending
  test "extract another column" do
    columns = SaddlePoints.columns("89 1903 3\n18 3 1\n9 4 800")
    assert Enum.at(columns, 1) == [1903, 3, 4]
  end

  @tag :pending
  test "no saddle point" do
    saddle_points = SaddlePoints.saddle_points("2 1\n1 2")
    assert saddle_points == []
  end

  @tag :pending
  test "a saddle point" do
    saddle_points = SaddlePoints.saddle_points("1 2\n3 4")
    assert saddle_points == [{0, 1}]
  end

  @tag :pending
  test "another saddle point" do
    saddle_points = SaddlePoints.saddle_points("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
    assert saddle_points == [{2, 2}]
  end

  @tag :pending
  test "multiple saddle points" do
    saddle_points = SaddlePoints.saddle_points("4 5 4\n3 5 5\n1 5 4")
    assert saddle_points == [{0, 1}, {1, 1}, {2, 1}]
  end
end
