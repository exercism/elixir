defmodule FlowerFieldTest do
  use ExUnit.Case

  # @tag :pending
  test "no rows" do
    input = []
    expected = []

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "no columns" do
    input = [""]
    expected = [""]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "no flowers" do
    input = [
      "   ",
      "   ",
      "   "
    ]

    expected = [
      "   ",
      "   ",
      "   "
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "flowers only" do
    input = [
      "***",
      "***",
      "***"
    ]

    expected = [
      "***",
      "***",
      "***"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "flower surrounded by spaces" do
    input = [
      "   ",
      " * ",
      "   "
    ]

    expected = [
      "111",
      "1*1",
      "111"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "space surrounded by flowers" do
    input = [
      "***",
      "* *",
      "***"
    ]

    expected = [
      "***",
      "*8*",
      "***"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "horizontal line" do
    input = [
      " * * "
    ]

    expected = [
      "1*2*1"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "horizontal line, flowers at edges" do
    input = [
      "*   *"
    ]

    expected = [
      "*1 1*"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "vertical line" do
    input = [
      " ",
      "*",
      " ",
      "*",
      " "
    ]

    expected = [
      "1",
      "*",
      "2",
      "*",
      "1"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "vertical line, flowers at edges" do
    input = [
      "*",
      " ",
      " ",
      " ",
      "*"
    ]

    expected = [
      "*",
      "1",
      " ",
      "1",
      "*"
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "cross" do
    input = [
      "  *  ",
      "  *  ",
      "*****",
      "  *  ",
      "  *  "
    ]

    expected = [
      " 2*2 ",
      "25*52",
      "*****",
      "25*52",
      " 2*2 "
    ]

    assert FlowerField.annotate(input) == expected
  end

  @tag :pending
  test "large garden" do
    input = [
      " *  * ",
      "  *   ",
      "    * ",
      "   * *",
      " *  * ",
      "      "
    ]

    expected = [
      "1*22*1",
      "12*322",
      " 123*2",
      "112*4*",
      "1*22*2",
      "111111"
    ]

    assert FlowerField.annotate(input) == expected
  end
end
