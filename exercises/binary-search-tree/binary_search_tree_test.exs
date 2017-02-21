if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("binary_search_tree.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule BinarySearchTreeTest do
  use ExUnit.Case

  def record_all_data(tree) do
    BinarySearchTree.map(tree, &(&1))
  end

  test "retains data" do
    assert BinarySearchTree.new(4).data == 4
  end

  @tag :pending
  test "inserting lower number" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)

    assert four.data == 4
    assert four.left.data == 2
  end

  @tag :pending
  test "inserting same number" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(4)

    assert four.data == 4
    assert four.left.data == 4
  end

  @tag :pending
  test "inserting higher number" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(5)

    assert four.data == 4
    assert four.right.data == 5
  end

  @tag :pending
  test "complex tree" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)
      |> BinarySearchTree.insert(6)
      |> BinarySearchTree.insert(1)
      |> BinarySearchTree.insert(3)
      |> BinarySearchTree.insert(7)
      |> BinarySearchTree.insert(5)

    assert four.data == 4
    assert four.left.data == 2
    assert four.left.left.data == 1
    assert four.left.right.data == 3
    assert four.right.data == 6
    assert four.right.left.data == 5
    assert four.right.right.data == 7
  end

  @tag :pending
  test "iterating one element" do
    four = BinarySearchTree.new(4)

    assert [4], record_all_data(four)
  end

  @tag :pending
  test "iterating over smaller element" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)

    assert [2, 4], record_all_data(four)
  end

  @tag :pending
  test "iterating over larger element" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(5)

    assert [4, 5], record_all_data(four)
  end

  @tag :pending
  test "iterating over complex tree" do
    four =
      BinarySearchTree.new(4)
      |> BinarySearchTree.insert(2)
      |> BinarySearchTree.insert(1)
      |> BinarySearchTree.insert(3)
      |> BinarySearchTree.insert(6)
      |> BinarySearchTree.insert(7)
      |> BinarySearchTree.insert(5)

    assert [1, 2, 3, 4, 5, 6, 7], record_all_data(four)
  end
end
