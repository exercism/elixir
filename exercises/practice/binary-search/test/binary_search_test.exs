defmodule BinarySearchTest do
  use ExUnit.Case

  # @tag :pending
  test "finds a value in a tuple with one element" do
    assert BinarySearch.search({6}, 6) == {:ok, 0}
    assert BinarySearch.search({3}, 3) == {:ok, 0}
  end

  @tag :pending
  test "finds a value in the middle of a tuple" do
    assert BinarySearch.search({1, 2, 4, 5, 6}, 4) == {:ok, 2}
    assert BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 6) == {:ok, 3}
  end

  @tag :pending
  test "finds a value at the beginning of a tuple" do
    assert BinarySearch.search({1, 2, 4, 5, 6}, 1) == {:ok, 0}
    assert BinarySearch.search({1, 3, 4, 5, 8, 9, 11}, 1) == {:ok, 0}
  end

  @tag :pending
  test "finds a value at the end of a tuple" do
    assert BinarySearch.search({1, 2, 4, 5, 6}, 6) == {:ok, 4}
    assert BinarySearch.search({1, 3, 4, 5, 8, 9, 11}, 11) == {:ok, 6}
  end

  @tag :pending
  test "finds a value in a tuple of odd length" do
    tuple = {1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634}
    assert BinarySearch.search(tuple, 144) == {:ok, 9}
  end

  @tag :pending
  test "finds a value in a tuple of even length" do
    tuple = {1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377}
    assert BinarySearch.search(tuple, 21) == {:ok, 5}
    assert BinarySearch.search(tuple, 34) == {:ok, 6}
  end

  @tag :pending
  test "identifies that a value is not included in the tuple" do
    assert BinarySearch.search({2, 4, 6}, 3) == :not_found
    assert BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 7) == :not_found
  end

  @tag :pending
  test "a value smaller than the tuple's smallest value is not found" do
    assert BinarySearch.search({2, 4, 6}, 1) == :not_found
    assert BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 0) == :not_found
  end

  @tag :pending
  test "a value larger than the tuple's largest value is not found" do
    assert BinarySearch.search({2, 4, 6}, 9) == :not_found
    assert BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 13) == :not_found
  end

  @tag :pending
  test "nothing is found in an empty tuple" do
    assert BinarySearch.search({}, 1) == :not_found
  end

  @tag :pending
  test "nothing is found when the left and right bounds cross" do
    assert BinarySearch.search({1, 2}, 0) == :not_found
  end
end
