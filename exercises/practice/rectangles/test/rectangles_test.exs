defmodule RectanglesTest do
  use ExUnit.Case

  # @tag :pending
  test "no rows" do
    input = ""

    assert Rectangles.count(input) == 0
  end

  @tag :pending
  test "no columns" do
    input = """
    """

    assert Rectangles.count(input) == 0
  end

  @tag :pending
  test "no rectangles" do
    input = """
    \s
    """

    assert Rectangles.count(input) == 0
  end

  @tag :pending
  test "one rectangle" do
    input = """
    +-+
    | |
    +-+
    """

    assert Rectangles.count(input) == 1
  end

  @tag :pending
  test "two rectangles without shared parts" do
    input = """
      +-+
      | |
    +-+-+
    | | \s
    +-+ \s
    """

    assert Rectangles.count(input) == 2
  end

  @tag :pending
  test "five rectangles with shared parts" do
    input = """
      +-+
      | |
    +-+-+
    | | |
    +-+-+
    """

    assert Rectangles.count(input) == 5
  end

  @tag :pending
  test "rectangle of height 1 is counted" do
    input = """
    +--+
    +--+
    """

    assert Rectangles.count(input) == 1
  end

  @tag :pending
  test "rectangle of width 1 is counted" do
    input = """
    ++
    ||
    ++
    """

    assert Rectangles.count(input) == 1
  end

  @tag :pending
  test "1x1 square is counted" do
    input = """
    ++
    ++
    """

    assert Rectangles.count(input) == 1
  end

  @tag :pending
  test "only complete rectangles are counted" do
    input = """
      +-+
        |
    +-+-+
    | | -
    +-+-+
    """

    assert Rectangles.count(input) == 1
  end

  @tag :pending
  test "rectangles can be of different sizes" do
    input = """
    +------+----+
    |      |    |
    +---+--+    |
    |   |       |
    +---+-------+
    """

    assert Rectangles.count(input) == 3
  end

  @tag :pending
  test "corner is required for a rectangle to be complete" do
    input = """
    +------+----+
    |      |    |
    +------+    |
    |   |       |
    +---+-------+
    """

    assert Rectangles.count(input) == 2
  end

  @tag :pending
  test "large input with many rectangles" do
    input = """
    +---+--+----+
    |   +--+----+
    +---+--+    |
    |   +--+----+
    +---+--+--+-+
    +---+--+--+-+
    +------+  | |
              +-+
    """

    assert Rectangles.count(input) == 60
  end

  @tag :pending
  test "rectangles must have four sides" do
    input = """
    +-+ +-+
    | | | |
    +-+-+-+
      | | \s
    +-+-+-+
    | | | |
    +-+ +-+
    """

    assert Rectangles.count(input) == 5
  end
end
