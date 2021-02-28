defmodule SquaresTest do
  use ExUnit.Case

  describe "square_of_sum" do
    # @tag :pending
    test "square of sum to 1" do
      assert Squares.square_of_sum(1) == 1
    end

    @tag :pending
    test "square of sum to 5" do
      assert Squares.square_of_sum(5) == 225
    end

    @tag :pending
    test "square of sum to 100" do
      assert Squares.square_of_sum(100) == 25_502_500
    end
  end

  describe "sum_of_squares" do
    @tag :pending
    test "sum of squares to 1" do
      assert Squares.sum_of_squares(1) == 1
    end

    @tag :pending
    test "sum of squares to 5" do
      assert Squares.sum_of_squares(5) == 55
    end

    @tag :pending
    test "sum of squares to 100" do
      assert Squares.sum_of_squares(100) == 338_350
    end
  end

  describe "difference" do
    @tag :pending
    test "difference of sum to 1" do
      assert Squares.difference(1) == 0
    end

    @tag :pending
    test "difference of sum to 5" do
      assert Squares.difference(5) == 170
    end

    @tag :pending
    test "difference of sum to 100" do
      assert Squares.difference(100) == 25_164_150
    end
  end
end
