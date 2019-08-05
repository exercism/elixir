defmodule SpiralTest do
  use ExUnit.Case

  # @tag :pending
  test "empty spiral" do
    assert Spiral.matrix(0) == []
  end

  @tag :pending
  test "trivial spiral" do
    assert Spiral.matrix(1) == [[1]]
  end

  @tag :pending
  test "spiral of side length 2" do
    assert Spiral.matrix(2) == [
             [1, 2],
             [4, 3]
           ]
  end

  @tag :pending
  test "spiral of side length 3" do
    assert Spiral.matrix(3) == [
             [1, 2, 3],
             [8, 9, 4],
             [7, 6, 5]
           ]
  end

  @tag :pending
  test "spiral of side length 4" do
    assert Spiral.matrix(4) == [
             [1, 2, 3, 4],
             [12, 13, 14, 5],
             [11, 16, 15, 6],
             [10, 9, 8, 7]
           ]
  end

  @tag :pending
  test "spiral of size 5" do
    assert Spiral.matrix(5) == [
             [1, 2, 3, 4, 5],
             [16, 17, 18, 19, 6],
             [15, 24, 25, 20, 7],
             [14, 23, 22, 21, 8],
             [13, 12, 11, 10, 9]
           ]
  end
end
