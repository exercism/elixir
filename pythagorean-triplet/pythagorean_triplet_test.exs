if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("pythagorean_triplet.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule PythagoreanTripletTest do
  use ExUnit.Case, async: true

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
  test "triplets up to 10" do
    triplets = Triplet.generate(1, 10)
    assert Enum.map(triplets, &Triplet.product/1) == [60, 480]
  end

  @tag :pending
  test "triplets from 11 up to 20" do
    triplets = Triplet.generate(11, 20)
    assert Enum.map(triplets, &Triplet.product/1) == [3840]
  end

  @tag :pending
  test "triplets where sum is 180 and max factor is 100" do
    triplets = Triplet.generate(1, 100, 180)
    assert Enum.map(triplets, &Triplet.product/1) == [118080, 168480, 202500]
  end
end
