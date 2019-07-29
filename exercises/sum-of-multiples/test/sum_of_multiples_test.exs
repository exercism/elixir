defmodule SumOfMultiplesTest do
  use ExUnit.Case

  # @tag :pending
  test "sum to 1" do
    assert SumOfMultiples.to(1, [3, 5]) == 0
  end

  @tag :pending
  test "sum to 3" do
    assert SumOfMultiples.to(4, [3, 5]) == 3
  end

  @tag :pending
  test "sum to 10" do
    assert SumOfMultiples.to(10, [3, 5]) == 23
  end

  @tag :pending
  test "sum to 20" do
    assert SumOfMultiples.to(20, [3, 5]) == 78
  end

  @tag :pending
  test "sum to 100" do
    assert SumOfMultiples.to(100, [3, 5]) == 2318
  end

  @tag :pending
  test "sum to 1000" do
    assert SumOfMultiples.to(1000, [3, 5]) == 233_168
  end

  @tag :pending
  test "configurable 7, 13, 17 to 20" do
    multiples = [7, 13, 17]
    assert SumOfMultiples.to(20, multiples) == 51
  end

  @tag :pending
  test "configurable 4, 6 to 15" do
    multiples = [4, 6]
    assert SumOfMultiples.to(15, multiples) == 30
  end

  @tag :pending
  test "configurable 5, 6, 8 to 150" do
    multiples = [5, 6, 8]
    assert SumOfMultiples.to(150, multiples) == 4419
  end

  @tag :pending
  test "configurable 43, 47 to 10000" do
    multiples = [43, 47]
    assert SumOfMultiples.to(10000, multiples) == 2_203_160
  end
end
