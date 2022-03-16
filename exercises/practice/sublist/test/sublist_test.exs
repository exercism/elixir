defmodule SublistTest do
  use ExUnit.Case

  # @tag :pending
  test "empty equals empty" do
    assert Sublist.compare([], []) == :equal
  end

  @tag :pending
  test "empty list within non empty list" do
    assert Sublist.compare([], [1, 2, 3]) == :sublist
  end

  @tag :pending
  test "non empty list contains empty list" do
    assert Sublist.compare([1, 2, 3], []) == :superlist
  end

  @tag :pending
  test "list equals itself" do
    assert Sublist.compare([1, 2, 3], [1, 2, 3]) == :equal
  end

  @tag :pending
  test "different lists" do
    assert Sublist.compare([1, 2, 3], [2, 3, 4]) == :unequal
  end

  @tag :pending
  test "comparing massive equal lists" do
    l = Enum.to_list(1..1_000_000)
    assert Sublist.compare(l, l) == :equal
  end

  @tag :pending
  test "false start" do
    assert Sublist.compare([1, 2, 5], [0, 1, 2, 3, 1, 2, 5, 6]) == :sublist
  end

  @tag :pending
  test "consecutive" do
    assert Sublist.compare([1, 1, 2], [0, 1, 1, 1, 2, 1, 2]) == :sublist
  end

  @tag :pending
  test "sublists at start" do
    assert Sublist.compare([0, 1, 2], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  @tag :pending
  test "sublists in middle" do
    assert Sublist.compare([2, 3, 4], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  @tag :pending
  test "sublists at end" do
    assert Sublist.compare([3, 4, 5], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  @tag :pending
  test "partially matching sublist at end" do
    assert Sublist.compare([1, 1, 2], [1, 1, 1, 2]) == :sublist
  end

  @tag :pending
  test "sublist early in huge list" do
    assert Sublist.compare([3, 4, 5], Enum.to_list(1..1_000_000)) == :sublist
  end

  @tag :pending
  @tag :slow
  test "huge sublist not in huge list" do
    assert Sublist.compare(Enum.to_list(10..1_000_001), Enum.to_list(1..1_000_000)) == :unequal
  end

  @tag :pending
  test "at start of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [0, 1, 2]) == :superlist
  end

  @tag :pending
  test "in middle of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [2, 3]) == :superlist
  end

  @tag :pending
  test "at end of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [3, 4, 5]) == :superlist
  end

  @tag :pending
  test "at end of partially matching superlist" do
    assert Sublist.compare([1, 1, 1, 2], [1, 1, 2]) == :superlist
  end

  @tag :pending
  test "superlist early in huge list" do
    assert Sublist.compare(Enum.to_list(1..1_000_000), [3, 4, 5]) == :superlist
  end

  @tag :pending
  test "first list missing element from second list" do
    assert Sublist.compare([1, 3], [1, 2, 3]) == :unequal
  end

  @tag :pending
  test "second list missing element from first list" do
    assert Sublist.compare([1, 2, 3], [1, 3]) == :unequal
  end

  @tag :pending
  test "first list missing additional digits from second list" do
    assert Sublist.compare([1, 2], [1, 22]) == :unequal
  end

  @tag :pending
  test "order matters to a list" do
    assert Sublist.compare([1, 2, 3], [3, 2, 1]) == :unequal
  end

  @tag :pending
  test "same digits but different numbers" do
    assert Sublist.compare([1, 0, 1], [10, 1]) == :unequal
  end

  @tag :pending
  test "strict equality needed" do
    assert Sublist.compare([1], [1.0, 2]) == :unequal
  end

  @tag :pending
  test "recurring values sublist" do
    assert Sublist.compare([1, 2, 1, 2, 3], [1, 2, 3, 1, 2, 1, 2, 3, 2, 1]) == :sublist
  end

  @tag :pending
  test "recurring values unequal" do
    assert Sublist.compare([1, 2, 1, 2, 3], [1, 2, 3, 1, 2, 3, 2, 3, 2, 1]) == :unequal
  end
end
