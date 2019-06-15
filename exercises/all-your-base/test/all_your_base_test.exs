defmodule AllYourBaseTest do
  use ExUnit.Case

  test "convert single bit one to decimal" do
    assert AllYourBase.convert([1], 2, 10) == [1]
  end

  @tag :pending
  test "convert binary to single decimal" do
    assert AllYourBase.convert([1, 0, 1], 2, 10) == [5]
  end

  @tag :pending
  test "convert single decimal to binary" do
    assert AllYourBase.convert([5], 10, 2) == [1, 0, 1]
  end

  @tag :pending
  test "convert binary to multiple decimal" do
    assert AllYourBase.convert([1, 0, 1, 0, 1, 0], 2, 10) == [4, 2]
  end

  @tag :pending
  test "convert decimal to binary" do
    assert AllYourBase.convert([4, 2], 10, 2) == [1, 0, 1, 0, 1, 0]
  end

  @tag :pending
  test "convert trinary to hexadecimal" do
    assert AllYourBase.convert([1, 1, 2, 0], 3, 16) == [2, 10]
  end

  @tag :pending
  test "convert hexadecimal to trinary" do
    assert AllYourBase.convert([2, 10], 16, 3) == [1, 1, 2, 0]
  end

  @tag :pending
  test "convert 15-bit integer" do
    assert AllYourBase.convert([3, 46, 60], 97, 73) == [6, 10, 45]
  end

  @tag :pending
  test "convert empty list" do
    assert AllYourBase.convert([], 2, 10) == nil
  end

  @tag :pending
  test "convert single zero" do
    assert AllYourBase.convert([0], 10, 2) == [0]
  end

  @tag :pending
  test "convert multiple zeros" do
    assert AllYourBase.convert([0, 0, 0], 10, 2) == [0]
  end

  @tag :pending
  test "convert leading zeros" do
    assert AllYourBase.convert([0, 6, 0], 7, 10) == [4, 2]
  end

  @tag :pending
  test "convert negative digit" do
    assert AllYourBase.convert([1, -1, 1, 0, 1, 0], 2, 10) == nil
  end

  @tag :pending
  test "convert invalid positive digit" do
    assert AllYourBase.convert([1, 2, 1, 0, 1, 0], 2, 10) == nil
  end

  @tag :pending
  test "convert first base is one" do
    assert AllYourBase.convert([0], 1, 10) == nil
  end

  @tag :pending
  test "convert second base is one" do
    assert AllYourBase.convert([1, 0, 1, 0, 1, 0], 2, 1) == nil
  end

  @tag :pending
  test "convert first base is zero" do
    assert AllYourBase.convert([], 0, 10) == nil
  end

  @tag :pending
  test "convert second base is zero" do
    assert AllYourBase.convert([7], 10, 0) == nil
  end

  @tag :pending
  test "convert first base is negative" do
    assert AllYourBase.convert([1], -2, 10) == nil
  end

  @tag :pending
  test "convert second base is negative" do
    assert AllYourBase.convert([1], 2, -7) == nil
  end

  @tag :pending
  test "convert both bases are negative" do
    assert AllYourBase.convert([1], -2, -7) == nil
  end
end
