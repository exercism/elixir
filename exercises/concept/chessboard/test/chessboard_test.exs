defmodule ChessboardTest do
  use ExUnit.Case

  @tag task_id: 1
  test "rank_range is a range from 1 to 8" do
    assert Chessboard.rank_range() == 1..8
  end

  @tag task_id: 2
  test "file_range is a range from ?A to ?H" do
    assert Chessboard.file_range() == ?A..?H
  end

  @tag task_id: 3
  test "ranks is a list of integers from 1 to 8" do
    assert Chessboard.ranks() == [1, 2, 3, 4, 5, 6, 7, 8]
  end

  @tag task_id: 4
  test "files is a list of letters (strings) from A to H" do
    assert Chessboard.files() == ["A", "B", "C", "D", "E", "F", "G", "H"]
  end
end
