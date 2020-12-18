defmodule ChessboardTest do
  use ExUnit.Case

  test "rank_range is a range from 1 to 8" do
    assert Chessboard.rank_range() == 1..8
  end

  test "file_range is a range from ?A to ?H" do
    assert Chessboard.file_range() == ?A..?H
  end

  test "ranks is a list of integers from 1 to 8" do
    assert Chessboard.ranks() == [1, 2, 3, 4, 5, 6, 7, 8]
  end

  test "files is a list of letters (strings) from A to H" do
    assert Chessboard.files() == ["A", "B", "C", "D", "E", "F", "G", "H"]
  end
end
