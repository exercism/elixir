if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("connect.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ConnectTest do
  use ExUnit.Case

  def remove_spaces(rows) do
    Enum.map(rows, &String.replace(&1, " ", ""))
  end

  # @tag :pending
  test "empty board has no winner" do
    board = remove_spaces [
      ". . . . .",
      " . . . . .",
      "  . . . . .",
      "   . . . . .",
      "    . . . . ."
    ]
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
  test "convulted path" do
    board = remove_spaces [
      ". X X . .",
      " X . X . X",
      "  . X . X .",
      "   . X X . .",
      "    O O O O O"
    ]
    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "rectangle, black wins" do
    board = remove_spaces [
      ". O . .",
      " O X X X",
      "  O X O .",
      "   X X O X",
      "    . O X ."
    ]
    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "rectangle, white wins" do
    board = remove_spaces [
      ". O . .",
      " O X X X",
      "  O O O .",
      "   X X O X",
      "    . O X ."
    ]
    assert Connect.result_for(board) == :white
  end

  @tag :pending
  test "spiral, black wins" do
    board = [
      "OXXXXXXXX",
      "OXOOOOOOO",
      "OXOXXXXXO",
      "OXOXOOOXO",
      "OXOXXXOXO",
      "OXOOOXOXO",
      "OXXXXXOXO",
      "OOOOOOOXO",
      "XXXXXXXXO"
    ]
    assert Connect.result_for(board) == :black
  end

  @tag :pending
  test "spiral, nobody wins" do
    board = [
      "OXXXXXXXX",
      "OXOOOOOOO",
      "OXOXXXXXO",
      "OXOXOOOXO",
      "OXOX.XOXO",
      "OXOOOXOXO",
      "OXXXXXOXO",
      "OOOOOOOXO",
      "XXXXXXXXO"
    ]
    assert Connect.result_for(board) == :none
  end
end
