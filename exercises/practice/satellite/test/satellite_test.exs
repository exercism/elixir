defmodule SatelliteTest do
  use ExUnit.Case

  # @tag :pending
  test "Empty tree" do
    preorder = []
    inorder = []
    tree = {}
    assert Satellite.build_tree(preorder, inorder) == {:ok, tree}
  end

  @tag :pending
  test "Tree with one item" do
    preorder = [:a]
    inorder = [:a]
    tree = {{}, :a, {}}
    assert Satellite.build_tree(preorder, inorder) == {:ok, tree}
  end

  @tag :pending
  test "Tree with many items" do
    preorder = ~w(a i x f r)a
    inorder = ~w(i a f x r)a
    tree = {{{}, :i, {}}, :a, {{{}, :f, {}}, :x, {{}, :r, {}}}}
    assert Satellite.build_tree(preorder, inorder) == {:ok, tree}
  end

  @tag :pending
  test "Reject traversals of different length" do
    preorder = [:a, :b]
    inorder = [:b, :a, :r]
    error = {:error, "traversals must have the same length"}
    assert Satellite.build_tree(preorder, inorder) == error
  end

  @tag :pending
  test "Reject inconsistent traversals of same length" do
    preorder = [:x, :y, :z]
    inorder = [:a, :b, :c]
    error = {:error, "traversals must have the same elements"}
    assert Satellite.build_tree(preorder, inorder) == error
  end

  @tag :pending
  test "Reject traversals with repeated items" do
    preorder = [:a, :b, :a]
    inorder = [:b, :a, :a]
    error = {:error, "traversals must contain unique items"}
    assert Satellite.build_tree(preorder, inorder) == error
  end
end
