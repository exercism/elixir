if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("custom_set.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule CustomSetTest do
  use ExUnit.Case

  # @tag :pending
  describe "new" do
    test "returns a CustomSet struct" do
      assert CustomSet.new([]) == %CustomSet{}
    end

    test "removes duplicates in the given enumerable" do
      actual = CustomSet.new([1, 1, 2, 3])
      expected = CustomSet.new([1, 2, 3])
      assert actual == expected
    end
  end

  @tag :pending
  describe "empty?" do
    test "sets with no elements are empty" do
      custom_set = CustomSet.new([])
      assert CustomSet.empty?(custom_set) == true
    end

    test "sets with elements are not empty" do
      custom_set = CustomSet.new([1])
      assert CustomSet.empty?(custom_set) == false
    end
  end

  @tag :pending
  describe "contains?" do
    test "nothing is contained in an empty set" do
      custom_set = CustomSet.new([])
      assert CustomSet.contains?(custom_set, 1) == false
    end

    test "when the element is in the set" do
      custom_set = CustomSet.new([1, 2, 3])
      assert CustomSet.contains?(custom_set, 1) == true
    end

    test "when the element is not in the set" do
      custom_set = CustomSet.new([1, 2, 3])
      assert CustomSet.contains?(custom_set, 4) == false
    end
  end

  @tag :pending
  describe "subset?" do
    test "empty set is a subset of another empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    test "empty set is a subset of non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    test "non-empty set is not a subset of empty set" do
      custom_set_1 = CustomSet.new([1])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == false
    end

    test "set is a subset of set with exact same elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([1, 2, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    test "set is a subset of larger set with same elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 1, 2, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    test "set is not a subset of set that does not contain its elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 1, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == false
    end
  end

  @tag :pending
  describe "disjoint?" do
    test "the empty set is disjoint with itself" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    test "empty set is disjoint with non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    test "non-empty set is disjoint with empty set" do
      custom_set_1 = CustomSet.new([1])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    test "sets are not disjoint if they share an element" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([2, 3])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == false
    end

    test "sets are disjoint if they share no elements" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([3, 4])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end
  end

  @tag :pending
  describe "equal?" do
    test "empty sets are equal" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == true
    end

    test "empty set is not equal to non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1, 2, 3])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end

    test "non-empty set is not equal to empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end

    test "sets with the same elements are equal" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([2, 1])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == true
    end

    test "sets with different elements are not equal" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([1, 2, 4])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end
  end

  @tag :pending
  describe "add" do
    test "add to empty set" do
      custom_set = CustomSet.new([])
      actual = CustomSet.add(custom_set, 3)
      expected = CustomSet.new([3])
      assert CustomSet.equal?(actual, expected)
    end

    test "add to non-empty set" do
      custom_set = CustomSet.new([1, 2, 4])
      actual = CustomSet.add(custom_set, 3)
      expected = CustomSet.new([1, 2, 3, 4])
      assert CustomSet.equal?(actual, expected)
    end

    test "adding an existing element does not change the set" do
      expected = CustomSet.new([1, 2, 3])
      actual = CustomSet.add(expected, 3)
      assert CustomSet.equal?(expected, actual)
    end
  end

  @tag :pending
  describe "intersection" do
    test "intersection of two empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "intersection of an empty set and non-empty set is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "intersection of a non-empty set and an empty set is an empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "intersection of two sets with no shared elements is an empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 5, 6])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "intersection of two sets with shared elements is a set of the shared elements" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([2, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end

  @tag :pending
  describe "difference" do
    test "difference of two empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "difference of empty set and non-empty set is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "difference of a non-empty set and an empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 2, 3, 4])
      assert CustomSet.equal?(actual, expected)
    end

    test "difference of two non-empty sets is a set of elements that are only in the first set" do
      custom_set_1 = CustomSet.new([3, 2, 1])
      custom_set_2 = CustomSet.new([2, 4])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end

  @tag :pending
  describe "union" do
    test "union of empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    test "union of an empty set and non-empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([2])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([2])
      assert CustomSet.equal?(actual, expected)
    end

    test "union of a non-empty set and empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([1, 3])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 3])
      assert CustomSet.equal?(actual, expected)
    end

    test "union of non-empty sets contains all unique elements" do
      custom_set_1 = CustomSet.new([1, 3])
      custom_set_2 = CustomSet.new([2, 3])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 2, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end
end
