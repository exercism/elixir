defmodule QueenAttackTest do
  use ExUnit.Case

  # @tag :pending
  test "default positions" do
    queens = Queens.new()
    assert queens.white == {0, 3}
    assert queens.black == {7, 3}
  end

  @tag :pending
  test "specific placement" do
    queens = Queens.new({3, 7}, {6, 1})
    assert queens.white == {3, 7}
    assert queens.black == {6, 1}
  end

  @tag :pending
  test "cannot occupy same space" do
    assert_raise ArgumentError, fn ->
      Queens.new({2, 4}, {2, 4})
    end
  end

  @tag :pending
  test "string representation" do
    queens = Queens.new({2, 4}, {6, 6})

    board =
      String.trim("""
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ W _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ B _
      _ _ _ _ _ _ _ _
      """)

    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "another string representation" do
    queens = Queens.new({7, 1}, {0, 0})

    board =
      String.trim("""
      B _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ W _ _ _ _ _ _
      """)

    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "yet another string representation" do
    queens = Queens.new({4, 3}, {3, 4})

    board =
      String.trim("""
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ B _ _ _
      _ _ _ W _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      """)

    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "queen placed on the bottom right corner" do
    queens = Queens.new({4, 3}, {7, 7})

    board =
      String.trim("""
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ W _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ B
      """)

    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "queen placed on the edge of the board" do
    queens = Queens.new({4, 3}, {2, 7})

    board =
      String.trim("""
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ B
      _ _ _ _ _ _ _ _
      _ _ _ W _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      _ _ _ _ _ _ _ _
      """)

    assert Queens.to_string(queens) == board
  end

  @tag :pending
  test "cannot attack" do
    queens = Queens.new({2, 3}, {4, 7})
    refute Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on same row" do
    queens = Queens.new({2, 4}, {2, 7})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on same column" do
    queens = Queens.new({5, 4}, {2, 4})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on diagonal" do
    queens = Queens.new({1, 1}, {6, 6})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on other diagonal" do
    queens = Queens.new({0, 6}, {1, 7})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on yet another diagonal" do
    queens = Queens.new({4, 1}, {6, 3})
    assert Queens.can_attack?(queens)
  end

  @tag :pending
  test "can attack on a diagonal slanted the other way" do
    queens = Queens.new({6, 1}, {1, 6})
    assert Queens.can_attack?(queens)
  end
end
