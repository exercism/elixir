defmodule FlattenArrayTest do
  use ExUnit.Case

  test "returns original list if there is nothing to flatten" do
    assert FlattenArray.flatten([1, 2, 3]) == [1, 2, 3]
  end

  @tag :pending
  test "flattens an empty nested list" do
    assert FlattenArray.flatten([[]]) == []
  end

  @tag :pending
  test "flattens a nested list" do
    assert FlattenArray.flatten([1, [2, [3], 4], 5, [6, [7, 8]]]) == [1, 2, 3, 4, 5, 6, 7, 8]
  end

  @tag :pending
  test "removes nil from list" do
    assert FlattenArray.flatten([1, nil, 2]) == [1, 2]
  end

  @tag :pending
  test "removes nil from a nested list" do
    assert FlattenArray.flatten([1, [2, nil, 4], 5]) == [1, 2, 4, 5]
  end

  @tag :pending
  test "returns an empty list if all values in nested list are nil" do
    assert FlattenArray.flatten([nil, [nil], [nil, [nil]]]) == []
  end
end
