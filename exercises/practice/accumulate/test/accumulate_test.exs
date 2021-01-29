defmodule AccumulateTest do
  use ExUnit.Case

  test "accumulate empty list" do
    assert Accumulate.accumulate([], fn n -> n * n end) == []
  end

  @tag :pending
  test "accumulate square numbers" do
    assert Accumulate.accumulate([1, 2, 3], fn n -> n * n end) == [1, 4, 9]
  end

  @tag :pending
  test "accumulate upcased strings" do
    fun = fn w -> String.upcase(w) end
    assert Accumulate.accumulate(["hello", "world"], fun) == ["HELLO", "WORLD"]
  end

  @tag :pending
  test "accumulate reversed strings" do
    fun = fn w -> String.reverse(w) end
    words = ~w(the quick brown fox etc)
    expected = ["eht", "kciuq", "nworb", "xof", "cte"]
    assert Accumulate.accumulate(words, fun) == expected
  end

  @tag :pending
  test "nested accumulate" do
    chars = ~w(a b c)
    nums = ~w(1 2 3)
    fun = fn c -> Accumulate.accumulate(nums, &(c <> &1)) end
    expected = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
    assert Accumulate.accumulate(chars, fun) == expected
  end
end
