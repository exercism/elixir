Code.load_file("../file_loader.ex", __DIR__)
FileLoader.load("difference_of_squares", __DIR__)

defmodule DifferenceOfSquaresTest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "square of sums to 5" do
    assert Squares.square_of_sums(5) == 225
  end

  @tag :pending
  test "sum of squares to 5" do
    assert Squares.sum_of_squares(5) == 55
  end

  @tag :pending
  test "difference of sums to 5" do
    assert Squares.difference(5) == 170
  end

  @tag :pending
  test "square of sums to 10" do
    assert Squares.square_of_sums(10) == 3025
  end

  @tag :pending
  test "sum of squares to 10" do
    assert Squares.sum_of_squares(10) == 385
  end

  @tag :pending
  test "difference of sums to 10" do
    assert Squares.difference(10) == 2640
  end

  @tag :pending
  test "square of sums to 100" do
    assert Squares.square_of_sums(100) == 25502500
  end

  @tag :pending
  test "sum of squares to 100" do
    assert Squares.sum_of_squares(100) == 338350
  end

  @tag :pending
  test "difference of sums to 100" do
    assert Squares.difference(100) == 25164150
  end

end
