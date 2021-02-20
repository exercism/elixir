defmodule BinarySearchTreeTest do
  use ExUnit.Case

  test "data is retained" do
    root = BinarySearchTree.new(4)
    assert root.data == 4
    assert root.left == nil
    assert root.right == nil
  end

  describe "insert data at proper node" do
    @tag :pending
    test "smaller number at left node" do
      root =
        BinarySearchTree.new(4)
        |> BinarySearchTree.insert(2)

      assert root.data == 4
      assert root.left.data == 2
      assert root.left.left == nil
      assert root.left.right == nil
      assert root.right == nil
    end

    @tag :pending
    test "same number at left node" do
      root =
        BinarySearchTree.new(4)
        |> BinarySearchTree.insert(4)

      assert root.data == 4
      assert root.left.data == 4
      assert root.left.left == nil
      assert root.left.right == nil
      assert root.right == nil
    end

    @tag :pending
    test "greater number at right node" do
      root =
        BinarySearchTree.new(4)
        |> BinarySearchTree.insert(5)

      assert root.data == 4
      assert root.left == nil
      assert root.right.data == 5
      assert root.right.left == nil
      assert root.right.right == nil
    end
  end

  @tag :pending
  test "can create complex tree" do
    root =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)
      |> BinarySearchTree.insert(6)
      |> BinarySearchTree.insert(1)
      |> BinarySearchTree.insert(3)
      |> BinarySearchTree.insert(5)
      |> BinarySearchTree.insert(7)

    assert root.data == 4
    assert root.left.data == 2
    assert root.left.left.data == 1
    assert root.left.left.left == nil
    assert root.left.left.right == nil
    assert root.left.right.data == 3
    assert root.left.right.left == nil
    assert root.left.right.right == nil
    assert root.right.data == 6
    assert root.right.left.data == 5
    assert root.right.left.left == nil
    assert root.right.left.right == nil
    assert root.right.right.data == 7
    assert root.right.right.left == nil
    assert root.right.right.right == nil
  end

  describe "can sort data" do
    @tag :pending
    test "can sort single number" do
      root = BinarySearchTree.new(2)

      assert [2] == BinarySearchTree.in_order(root)
    end

    @tag :pending
    test "can sort if second number is smaller than first" do
      root =
        BinarySearchTree.new(2)
        |> BinarySearchTree.insert(1)

      assert [1, 2] == BinarySearchTree.in_order(root)
    end

    @tag :pending
    test "can sort if second number is the same as the first" do
      root =
        BinarySearchTree.new(2)
        |> BinarySearchTree.insert(2)

      assert [2, 2] == BinarySearchTree.in_order(root)
    end

    @tag :pending
    test "can sort if second number is greater than the first" do
      root =
        BinarySearchTree.new(2)
        |> BinarySearchTree.insert(3)

      assert [2, 3] == BinarySearchTree.in_order(root)
    end

    @tag :pending
    test "can sort complex tree" do
      root =
        BinarySearchTree.new(2)
        |> BinarySearchTree.insert(1)
        |> BinarySearchTree.insert(3)
        |> BinarySearchTree.insert(6)
        |> BinarySearchTree.insert(7)
        |> BinarySearchTree.insert(5)

      assert [1, 2, 3, 5, 6, 7] == BinarySearchTree.in_order(root)
    end
  end
end
