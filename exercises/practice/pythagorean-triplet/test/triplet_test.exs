defmodule TripletTest do
  use ExUnit.Case

  # @tag :pending
  test "sum" do
    triplet = [3, 4, 5]
    assert Triplet.sum(triplet) == 12
  end

  @tag :pending
  test "product" do
    triplet = [3, 4, 5]
    assert Triplet.product(triplet) == 60
  end

  @tag :pending
  test "pythagorean" do
    triplet = [3, 4, 5]
    assert Triplet.pythagorean?(triplet)
  end

  @tag :pending
  test "not pythagorean" do
    triplet = [5, 6, 7]
    refute Triplet.pythagorean?(triplet)
  end

  @tag :pending
  test "triplets whose sum is 12" do
    assert Triplet.generate(12) == [[3, 4, 5]]
  end

  @tag :pending
  test "triplets whose sum is 108" do
    assert Triplet.generate(108) == [[27, 36, 45]]
  end

  @tag :pending
  test "triplets whose sum is 1000" do
    assert Triplet.generate(1000) == [[200, 375, 425]]
  end

  @tag :pending
  test "no matching triplets for 1001" do
    assert Triplet.generate(1001) == []
  end

  @tag :pending
  test "returns all matching triplets" do
    assert Triplet.generate(90) == [[9, 40, 41], [15, 36, 39]]
  end

  @tag :pending
  test "several matching triplets" do
    assert Triplet.generate(840) == [
             [40, 399, 401],
             [56, 390, 394],
             [105, 360, 375],
             [120, 350, 370],
             [140, 336, 364],
             [168, 315, 357],
             [210, 280, 350],
             [240, 252, 348]
           ]
  end

  @tag :pending
  @tag :slow
  test "triplets for large number" do
    assert Triplet.generate(30000) == [
             [1200, 14375, 14425],
             [1875, 14000, 14125],
             [5000, 12000, 13000],
             [6000, 11250, 12750],
             [7500, 10000, 12500]
           ]
  end
end
