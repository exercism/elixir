if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("queen_attack.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule QueenAttackTest do
  use ExUnit.Case

  # @tag :pending
  test "default positions" do
    queens = Queens.new
    assert queens.white == {0, 3}
    assert queens.black == {7, 3}
  end

  @tag :pending
  test "specific placement" do
    queens = Queens.new(white: {3, 7}, black: {6, 1})
    assert queens.white == {3, 7}
    assert queens.black == {6, 1}
  end

  @tag :pending
  test "specific placement with keyword args swapped" do
    queens = Queens.new(black: {6, 1}, white: {3, 7})
    assert queens.white == {3, 7}
    assert queens.black == {6, 1}
  end

  @tag :pending
  test "cannot occupy same space" do
    assert_raise ArgumentError, fn ->
      Queens.new(white: {2, 4}, black: {2, 4})
    end
  end

  @tag :pending
  test "string representation" do
    queens = Queens.new(white: {2, 4}, black: {6, 6})
    board = String.strip """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ W _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "another string representation" do
    queens = Queens.new(white: {7, 1}, black: {0, 0})
    board = String.strip """
B _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "yet another string representation" do
    queens = Queens.new(white: {4, 3}, black: {3, 4})
    board = String.strip """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ B _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "cannot attack" do
    queens = Queens.new(white: {2, 3}, black: {4, 7})
    refute Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on same row" do
    queens = Queens.new(white: {2, 4}, black: {2, 7})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on same column" do
    queens = Queens.new(white: {5, 4}, black: {2, 4})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on diagonal" do
    queens = Queens.new(white: {1, 1}, black: {6, 6})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on other diagonal" do
    queens = Queens.new(white: {0, 6}, black: {1, 7})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on yet another diagonal" do
    queens = Queens.new(white: {4, 1}, black: {6, 3})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on a diagonal slanted the other way" do
    queens = Queens.new(white: {6, 1}, black: {1, 6})
    assert Queens.can_attack?(queens)
  end
end
