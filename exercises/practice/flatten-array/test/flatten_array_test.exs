defmodule FlattenArrayTest do
  use ExUnit.Case

  # @tag :pending
  test "no nesting" do
    assert FlattenArray.flatten([0, 1, 2]) ==
             [0, 1, 2]
  end

  @tag :pending
  test "flattens an empty nested list" do
    assert FlattenArray.flatten([[]]) ==
             []
  end

  @tag :pending
  test "flattens array with just integers present" do
    assert FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8]) ==
             [1, 2, 3, 4, 5, 6, 7, 8]
  end

  @tag :pending
  test "5 level nesting" do
    assert FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]) ==
             [0, 2, 2, 3, 8, 100, 4, 50, -2]
  end

  @tag :pending
  test "6 level nesting" do
    assert FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8]) ==
             [1, 2, 3, 4, 5, 6, 7, 8]
  end

  @tag :pending
  test "removes nil from list" do
    assert FlattenArray.flatten([1, nil, 2]) ==
             [1, 2]
  end

  @tag :pending
  test "6 level nesting with nil values" do
    assert FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]) ==
             [0, 2, 2, 3, 8, 100, -2]
  end

  @tag :pending
  test "all values in nested list are null" do
    assert FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]) ==
             []
  end
end
