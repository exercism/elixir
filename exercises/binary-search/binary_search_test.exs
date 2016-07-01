if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("binary_search.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule BinarySearchTest do
  use ExUnit.Case

  test "returns :not_found on empty list" do
    assert BinarySearch.search([], 2) == :not_found
  end

  @tag :pending
  test "raises ArgumentError for unsorted list" do
    assert_raise ArgumentError, "expected list to be sorted", fn ->
      BinarySearch.search([3, 2, 1], 2)
    end
  end

  @tag :pending
  test "returns :not_found when key is not in the list" do
    assert BinarySearch.search([2, 4, 6], 3) == :not_found
  end

  @tag :pending
  test "finds key in a list with a single item" do
    assert BinarySearch.search([3], 3) == {:ok, 0}
  end

  @tag :pending
  test "finds key when it is the first element in list" do
    assert BinarySearch.search([1, 2, 4, 5, 6], 1) == {:ok, 0}
  end

  @tag :pending
  test "finds key when it is in the middle of the list" do
    assert BinarySearch.search([1, 2, 4, 5, 6], 4) == {:ok, 2}
  end

  @tag :pending
  test "finds key when it is the last element in list" do
    assert BinarySearch.search([1, 2, 4, 5, 6], 6) == {:ok, 4}
  end

  @tag :pending
  test "finds key in a list with an even number of elements" do
    list = [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
    assert BinarySearch.search(list, 21) == {:ok, 5}
    assert BinarySearch.search(list, 34) == {:ok, 6}
  end
end
