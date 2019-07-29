defmodule BinarySearchTreeTest do
  use ExUnit.Case

  test "retains data" do
    assert BinarySearchTree.new(4).data == 4
  end

  @tag :pending
  test "inserting lower number" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)

    assert root.data == 4
    assert root.left.data == 2
  end

  @tag :pending
  test "inserting same number" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(4)

    assert root.data == 4
    assert root.left.data == 4
  end

  @tag :pending
  test "inserting higher number" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(5)

    assert root.data == 4
    assert root.right.data == 5
  end

  @tag :pending
  test "complex tree" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)
      |> BinarySearchTree.insert(6)
      |> BinarySearchTree.insert(1)
      |> BinarySearchTree.insert(3)
      |> BinarySearchTree.insert(7)
      |> BinarySearchTree.insert(5)

    assert root.data == 4
    assert root.left.data == 2
    assert root.left.left.data == 1
    assert root.left.right.data == 3
    assert root.right.data == 6
    assert root.right.left.data == 5
    assert root.right.right.data == 7
  end

  @tag :pending
  test "iterating one element" do
    root = BinarySearchTree.new(4)

    assert [4] == BinarySearchTree.in_order(root)
  end

  @tag :pending
  test "iterating over smaller element" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)

    assert [2, 4] == BinarySearchTree.in_order(root)
  end

  @tag :pending
  test "iterating over larger element" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(5)

    assert [4, 5] == BinarySearchTree.in_order(root)
  end

  @tag :pending
  test "iterating over complex tree" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)
      |> BinarySearchTree.insert(1)
      |> BinarySearchTree.insert(3)
      |> BinarySearchTree.insert(6)
      |> BinarySearchTree.insert(7)
      |> BinarySearchTree.insert(5)

    assert [1, 2, 3, 4, 5, 6, 7] == BinarySearchTree.in_order(root)
  end
end
