defmodule CustomSetTest do
  use ExUnit.Case

  describe "new" do
    # @tag :pending
    test "returns a CustomSet struct" do
      assert CustomSet.new([]) == %CustomSet{}
    end

    @tag :pending
    test "removes duplicates in the given enumerable" do
      actual = CustomSet.new([1, 1, 2, 3])
      expected = CustomSet.new([1, 2, 3])
      assert actual == expected
    end
  end

  describe "empty?" do
    @tag :pending
    test "sets with no elements are empty" do
      custom_set = CustomSet.new([])
      assert CustomSet.empty?(custom_set) == true
    end

    @tag :pending
    test "sets with elements are not empty" do
      custom_set = CustomSet.new([1])
      assert CustomSet.empty?(custom_set) == false
    end
  end

  describe "contains?" do
    @tag :pending
    test "nothing is contained in an empty set" do
      custom_set = CustomSet.new([])
      assert CustomSet.contains?(custom_set, 1) == false
    end

    @tag :pending
    test "when the element is in the set" do
      custom_set = CustomSet.new([1, 2, 3])
      assert CustomSet.contains?(custom_set, 1) == true
    end

    @tag :pending
    test "when the element is not in the set" do
      custom_set = CustomSet.new([1, 2, 3])
      assert CustomSet.contains?(custom_set, 4) == false
    end
  end

  describe "subset?" do
    @tag :pending
    test "empty set is a subset of another empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "empty set is a subset of non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "non-empty set is not a subset of empty set" do
      custom_set_1 = CustomSet.new([1])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == false
    end

    @tag :pending
    test "set is a subset of set with exact same elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([1, 2, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "set is a subset of larger set with same elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 1, 2, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "set is not a subset of set that does not contain its elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 1, 3])
      assert CustomSet.subset?(custom_set_1, custom_set_2) == false
    end
  end

  describe "disjoint?" do
    @tag :pending
    test "the empty set is disjoint with itself" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "empty set is disjoint with non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "non-empty set is disjoint with empty set" do
      custom_set_1 = CustomSet.new([1])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "sets are not disjoint if they share an element" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([2, 3])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == false
    end

    @tag :pending
    test "sets are disjoint if they share no elements" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([3, 4])
      assert CustomSet.disjoint?(custom_set_1, custom_set_2) == true
    end
  end

  describe "equal?" do
    @tag :pending
    test "empty sets are equal" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "empty set is not equal to non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([1, 2, 3])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end

    @tag :pending
    test "non-empty set is not equal to empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end

    @tag :pending
    test "sets with the same elements are equal" do
      custom_set_1 = CustomSet.new([1, 2])
      custom_set_2 = CustomSet.new([2, 1])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == true
    end

    @tag :pending
    test "sets with different elements are not equal" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([1, 2, 4])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end

    @tag :pending
    test "set is not equal to larger set with same elements" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([1, 2, 3, 4])
      assert CustomSet.equal?(custom_set_1, custom_set_2) == false
    end
  end

  describe "add" do
    @tag :pending
    test "add to empty set" do
      custom_set = CustomSet.new([])
      actual = CustomSet.add(custom_set, 3)
      expected = CustomSet.new([3])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "add to non-empty set" do
      custom_set = CustomSet.new([1, 2, 4])
      actual = CustomSet.add(custom_set, 3)
      expected = CustomSet.new([1, 2, 3, 4])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "adding an existing element does not change the set" do
      expected = CustomSet.new([1, 2, 3])
      actual = CustomSet.add(expected, 3)
      assert CustomSet.equal?(expected, actual)
    end
  end

  describe "intersection" do
    @tag :pending
    test "intersection of two empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "intersection of an empty set and non-empty set is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "intersection of a non-empty set and an empty set is an empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "intersection of two sets with no shared elements is an empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3])
      custom_set_2 = CustomSet.new([4, 5, 6])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "intersection of two sets with shared elements is a set of the shared elements" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.intersection(custom_set_1, custom_set_2)
      expected = CustomSet.new([2, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end

  describe "difference" do
    @tag :pending
    test "difference of two empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "difference of empty set and non-empty set is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([3, 2, 5])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "difference of a non-empty set and an empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([1, 2, 3, 4])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 2, 3, 4])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "difference of two non-empty sets is a set of elements that are only in the first set" do
      custom_set_1 = CustomSet.new([3, 2, 1])
      custom_set_2 = CustomSet.new([2, 4])
      actual = CustomSet.difference(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end

  describe "union" do
    @tag :pending
    test "union of empty sets is an empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "union of an empty set and non-empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([])
      custom_set_2 = CustomSet.new([2])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([2])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "union of a non-empty set and empty set is the non-empty set" do
      custom_set_1 = CustomSet.new([1, 3])
      custom_set_2 = CustomSet.new([])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 3])
      assert CustomSet.equal?(actual, expected)
    end

    @tag :pending
    test "union of non-empty sets contains all unique elements" do
      custom_set_1 = CustomSet.new([1, 3])
      custom_set_2 = CustomSet.new([2, 3])
      actual = CustomSet.union(custom_set_1, custom_set_2)
      expected = CustomSet.new([1, 2, 3])
      assert CustomSet.equal?(actual, expected)
    end
  end
end
