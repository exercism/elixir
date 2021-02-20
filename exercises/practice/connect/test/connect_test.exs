defmodule ConnectTest do
  use ExUnit.Case

  def remove_spaces(rows) do
    Enum.map(rows, &String.replace(&1, " ", ""))
  end

  # @tag :pending
  test "empty board has no winner" do
    board =
      remove_spaces([
        ". . . . .",
        " . . . . .",
        "  . . . . .",
        "   . . . . .",
        "    . . . . ."
      ])

    assert Connect.result_for(board) == :none
  end

  @tag :pending
  test "1x1 board with black stone" do
    board = ["X"]
    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "1x1 board with white stone" do
    board = ["O"]
    assert Connect.result_for(board) == :white
  end

  @tag :pending
  test "only edges does not make a winner" do
    board =
      remove_spaces([
        "O O O X",
        " X . . X",
        "  X . . X",
        "   X O O O"
      ])

    assert Connect.result_for(board) == :none
  end

  @tag :pending
  test "illegal diagonal does not make a winner" do
    board =
      remove_spaces([
        "X O . .",
        " O X X X",
        "  O X O .",
        "   . O X .",
        "    X X O O"
      ])

    assert Connect.result_for(board) == :none
  end

  @tag :pending
  test "nobody wins crossing adjacent angles" do
    board =
      remove_spaces([
        "X . . .",
        " . X O .",
        "  O . X O",
        "   . O . X",
        "    . . O ."
      ])

    assert Connect.result_for(board) == :none
  end

  @tag :pending
  test "black wins crossing from left to right" do
    board =
      remove_spaces([
        ". O . .",
        " O X X X",
        "  O X O .",
        "   X X O X",
        "    . O X ."
      ])

    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "white wins crossing from top to bottom" do
    board =
      remove_spaces([
        ". O . .",
        " O X X X",
        "  O O O .",
        "   X X O X",
        "    . O X ."
      ])

    assert Connect.result_for(board) == :white
  end

  @tag :pending
  test "black wins using a convoluted path" do
    board =
      remove_spaces([
        ". X X . .",
        " X . X . X",
        "  . X . X .",
        "   . X X . .",
        "    O O O O O"
      ])

    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "black wins using a spiral path" do
    board =
      remove_spaces([
        "O X X X X X X X X",
        " O X O O O O O O O",
        "  O X O X X X X X O",
        "   O X O X O O O X O",
        "    O X O X X X O X O",
        "     O X O O O X O X O",
        "      O X X X X X O X O",
        "       O O O O O O O X O",
        "        X X X X X X X X O"
      ])

    assert Connect.result_for(board) == :black
  end
end
