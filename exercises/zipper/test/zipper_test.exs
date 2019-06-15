defmodule ZipperTest do
  alias BinTree, as: BT
  import Zipper
  use ExUnit.Case

  defp bt(value, left, right), do: %BT{value: value, left: left, right: right}
  defp leaf(value), do: %BT{value: value}

  defp t1, do: bt(1, bt(2, nil, leaf(3)), leaf(4))
  defp t2, do: bt(1, bt(5, nil, leaf(3)), leaf(4))
  defp t3, do: bt(1, bt(2, leaf(5), leaf(3)), leaf(4))
  defp t4, do: bt(1, leaf(2), leaf(4))
  defp t5, do: bt(1, bt(2, nil, leaf(3)), bt(6, leaf(7), leaf(8)))
  defp t6, do: bt(1, bt(2, nil, leaf(5)), leaf(4))

  # @tag :pending
  test "data is retained" do
    assert t1() |> from_tree() |> to_tree() == t1()
  end

  @tag :pending
  test "left, right and value" do
    assert t1() |> from_tree() |> left() |> right() |> value() == 3
  end

  @tag :pending
  test "dead end" do
    assert t1() |> from_tree() |> left() |> left() == nil
  end

  @tag :pending
  test "tree from deep focus" do
    assert t1() |> from_tree() |> left() |> right() |> to_tree() == t1()
  end

  @tag :pending
  test "traversing up from top" do
    assert t1() |> from_tree() |> up() == nil
  end

  @tag :pending
  test "left, right, and up" do
    zipper = t1() |> from_tree() |> left() |> up() |> right() |> up() |> left() |> right()
    assert value(zipper) == 3
  end

  @tag :pending
  test "set_value" do
    assert t1() |> from_tree() |> left() |> set_value(5) |> to_tree() == t2()
  end

  @tag :pending
  test "set_value after traversing up" do
    assert t1() |> from_tree() |> left() |> right() |> up() |> set_value(5) |> to_tree() == t2()
  end

  @tag :pending
  test "set_left with leaf" do
    assert t1() |> from_tree() |> left() |> set_left(leaf(5)) |> to_tree() == t3()
  end

  @tag :pending
  test "set_right with nil" do
    assert t1() |> from_tree() |> left() |> set_right(nil) |> to_tree() == t4()
  end

  @tag :pending
  test "set_right with subtree" do
    assert t1() |> from_tree() |> set_right(bt(6, leaf(7), leaf(8))) |> to_tree() == t5()
  end

  @tag :pending
  test "set_value on deep focus" do
    assert t1() |> from_tree() |> left() |> right() |> set_value(5) |> to_tree() == t6()
  end
end
