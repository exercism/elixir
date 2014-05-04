if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("difference_of_squares.exs")
end

ExUnit.start

defmodule DifferenceOfSquaresTest do
  use ExUnit.Case, async: true

  test "square of sums to 5" do
    assert Squares.square_of_sums(5) == 225
  end

  test "sum of squares to 5" do
    assert Squares.sum_of_squares(5) == 55
  end

  test "difference of sums to 5" do
    assert Squares.difference(5) == 170
  end

  test "square of sums to 10" do
    assert Squares.square_of_sums(10) == 3025
  end

  test "sum of squares to 10" do
    assert Squares.sum_of_squares(10) == 385
  end

  test "difference of sums to 10" do
    assert Squares.difference(10) == 2640
  end

  test "square of sums to 100" do
    assert Squares.square_of_sums(100) == 25502500
  end

  test "sum of squares to 100" do
    assert Squares.sum_of_squares(100) == 338350
  end

  test "difference of sums to 100" do
    assert Squares.difference(100) == 25164150
  end

end
