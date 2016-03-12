if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("sublist.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SublistTest do
  use ExUnit.Case

  test "empty equals empty" do
    assert Sublist.compare([], []) == :equal
  end

  @tag :pending
  test "empty is a sublist of anything" do
    assert Sublist.compare([], [nil]) == :sublist
  end

  @tag :pending
  test "anything is a superlist of empty" do
    assert Sublist.compare([nil], []) == :superlist
  end

  @tag :pending
  test "1 is not 2" do
    assert Sublist.compare([1], [2]) == :unequal
  end

  @tag :pending
  test "comparing massive equal lists" do
    l = Enum.to_list(1..1_000_000)
    assert Sublist.compare(l, l) == :equal
  end

  @tag :pending
  test "sublist at start" do
    assert Sublist.compare([1,2,3],[1,2,3,4,5]) == :sublist
  end

  @tag :pending
  test "sublist in middle" do
    assert Sublist.compare([4,3,2],[5,4,3,2,1]) == :sublist
  end

  @tag :pending
  test "sublist at end" do
    assert Sublist.compare([3,4,5],[1,2,3,4,5]) == :sublist
  end

  @tag :pending
  test "partially matching sublist at start" do
    assert Sublist.compare([1,1,2], [1,1,1,2]) == :sublist
  end

  @tag :pending
  test "sublist early in huge list" do
    assert Sublist.compare([3,4,5], Enum.to_list(1..1_000_000)) == :sublist
  end

  @tag :pending
  test "huge sublist not in huge list" do
    assert Sublist.compare(Enum.to_list(10..1_000_001),
                           Enum.to_list(1..1_000_000))
           == :unequal
  end

  @tag :pending
  test "superlist at start" do
    assert Sublist.compare([1,2,3,4,5],[1,2,3]) == :superlist
  end

  @tag :pending
  test "superlist in middle" do
    assert Sublist.compare([5,4,3,2,1],[4,3,2]) == :superlist
  end

  @tag :pending
  test "superlist at end" do
    assert Sublist.compare([1,2,3,4,5],[3,4,5]) == :superlist
  end

  @tag :pending
  test "1 and 2 does not contain 3" do
    assert Sublist.compare([1,2], [3]) == :unequal
  end

  @tag :pending
  test "partially matching superlist at start" do
    assert Sublist.compare([1,1,1,2], [1,1,2]) == :superlist
  end

  @tag :pending
  test "superlist early in huge list" do
    assert Sublist.compare(Enum.to_list(1..1_000_000), [3,4,5]) == :superlist
  end

  @tag :pending
  test "strict equality needed" do
    assert Sublist.compare([1], [1.0, 2]) == :unequal
  end

  @tag :pending
  test "recurring values sublist" do
    assert Sublist.compare([1,2,1,2,3], [1,2,3,1,2,1,2,3,2,1]) == :sublist
  end

  @tag :pending
  test "recurring values unequal" do
    assert Sublist.compare([1,2,1,2,3], [1,2,3,1,2,3,2,3,2,1]) == :unequal
  end
end
