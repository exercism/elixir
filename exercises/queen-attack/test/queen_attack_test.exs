defmodule QueenAttackTest do
  use ExUnit.Case

  describe "test creation of queens with valid and invalid positions" do
    # @tag :pending
    test "queen with a valid position" do
      assert Queens.new(white: {2, 2})
    end

    @tag :pending
    test "queen must have positive row" do
      assert_raise ArgumentError, fn ->
        Queens.new(white: {-2, 2})
      end
    end

    @tag :pending
    test "queen must have row on board" do
      assert_raise ArgumentError, fn ->
        Queens.new(white: {8, 4})
      end
    end

    @tag :pending
    test "queen must have positive column" do
      assert_raise ArgumentError, fn ->
        Queens.new(white: {2, -2})
      end
    end

    @tag :pending
    test "queen must have column on board" do
      assert_raise ArgumentError, fn ->
        Queens.new(white: {4, 8})
      end
    end

    @tag :pending
    test "specific placement" do
      queens = Queens.new(white: {3, 7}, black: {6, 1})
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
    test "cannot occupy same space, with black first" do
      assert_raise ArgumentError, fn ->
        Queens.new(black: {2, 4}, white: {2, 4})
      end
    end

    @tag :pending
    test "invalid queen color" do
      assert_raise ArgumentError, fn ->
        Queens.new(blue: {0, 1})
      end
    end
  end

  describe "test the ability of one queen to attack another" do
    @tag :pending
    test "cannot attack" do
      queens = Queens.new(white: {2, 4}, black: {6, 6})
      refute Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on same row" do
      queens = Queens.new(white: {2, 4}, black: {2, 6})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on same column" do
      queens = Queens.new(white: {5, 4}, black: {2, 4})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on first diagonal" do
      queens = Queens.new(white: {2, 2}, black: {0, 4})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on second diagonal" do
      queens = Queens.new(white: {2, 2}, black: {3, 1})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on third diagonal" do
      queens = Queens.new(white: {2, 2}, black: {1, 1})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "can attack on fourth diagonal" do
      queens = Queens.new(white: {1, 7}, black: {0, 6})
      assert Queens.can_attack?(queens)
    end

    @tag :pending
    test "cannot attack when only one queen set" do
      queens = Queens.new(white: {0, 5})
      refute Queens.can_attack?(queens)
    end
  end

  describe "test the string representation of queens on board" do
    @tag :pending
    test "string representation" do
      queens = Queens.new(white: {2, 4}, black: {6, 6})

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
      queens = Queens.new(white: {7, 1}, black: {0, 0})

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
      queens = Queens.new(white: {4, 3}, black: {3, 4})

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
      queens = Queens.new(white: {4, 3}, black: {7, 7})

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
      queens = Queens.new(white: {4, 3}, black: {2, 7})

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
    test "queens positioned on the same row" do
      queens = Queens.new(white: {4, 4}, black: {4, 5})

      board =
        String.trim("""
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ W B _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        """)

      assert Queens.to_string(queens) == board
    end

    @tag :pending
    test "string representation with single white queen" do
      queens = Queens.new(white: {2, 4})

      board =
        String.trim("""
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ W _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        """)

      assert Queens.to_string(queens) == board
    end

    @tag :pending
    test "string representation with single black queen" do
      queens = Queens.new(black: {3, 5})

      board =
        String.trim("""
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ B _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        _ _ _ _ _ _ _ _
        """)

      assert Queens.to_string(queens) == board
    end
  end
end
