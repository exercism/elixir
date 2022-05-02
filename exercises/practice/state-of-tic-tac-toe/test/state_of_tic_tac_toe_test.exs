defmodule StateOfTicTacToeTest do
  use ExUnit.Case

  describe "Won games" do
    # @tag :pending
    test "Finished game where X won via left column victory" do
      board = """
      XOO
      X..
      X..
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via middle column victory" do
      board = """
      OXO
      .X.
      .X.
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via right column victory" do
      board = """
      OOX
      ..X
      ..X
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via left column victory" do
      board = """
      OXX
      OX.
      O..
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via middle column victory" do
      board = """
      XOX
      .OX
      .O.
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via right column victory" do
      board = """
      XXO
      .XO
      ..O
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via top row victory" do
      board = """
      XXX
      XOO
      O..
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via middle row victory" do
      board = """
      O..
      XXX
      .O.
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via bottom row victory" do
      board = """
      .OO
      O.X
      XXX
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via top row victory" do
      board = """
      OOO
      XXO
      XX.
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via middle row victory" do
      board = """
      XX.
      OOO
      X..
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via bottom row victory" do
      board = """
      XOX
      .XX
      OOO
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via falling diagonal victory" do
      board = """
      XOO
      .X.
      ..X
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via rising diagonal victory" do
      board = """
      O.X
      OX.
      X..
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via falling diagonal victory" do
      board = """
      OXX
      OOX
      X.O
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where O won via rising diagonal victory" do
      board = """
      ..O
      .OX
      OXX
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via a row and a column victory" do
      board = """
      XXX
      XOO
      XOO
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end

    @tag :pending
    test "Finished game where X won via two diagonal victories" do
      board = """
      XOX
      OXO
      XOX
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :win}
    end
  end

  describe "Drawn games" do
    @tag :pending
    test "Draw" do
      board = """
      XOX
      XXO
      OXO
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :draw}
    end

    @tag :pending
    test "Another Draw" do
      board = """
      XXO
      OXX
      XOO
      """

      {:ok, :draw}

      assert StateOfTicTacToe.game_state(board) == {:ok, :draw}
    end
  end

  describe "Ongoing games" do
    @tag :pending
    test "Ongoing game: one move in" do
      board = """
      ...
      X..
      ...
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :ongoing}
    end

    @tag :pending
    test "Ongoing game: two moves in" do
      board = """
      O..
      .X.
      ...
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :ongoing}
    end

    @tag :pending
    test "Ongoing game: five moves in" do
      board = """
      X..
      .XO
      OX.
      """

      assert StateOfTicTacToe.game_state(board) == {:ok, :ongoing}
    end
  end

  describe "Invalid boards" do
    @tag :pending
    test "Invalid board: X went twice" do
      board = """
      XX.
      ...
      ...
      """

      assert StateOfTicTacToe.game_state(board) == {:error, "Wrong turn order: X went twice"}
    end

    @tag :pending
    test "Invalid board: O started" do
      board = """
      OOX
      ...
      ...
      """

      assert StateOfTicTacToe.game_state(board) == {:error, "Wrong turn order: O started"}
    end

    @tag :pending
    test "Invalid board: X won and O kept playing" do
      board = """
      XXX
      OOO
      ...
      """

      assert StateOfTicTacToe.game_state(board) ==
               {:error, "Impossible board: game should have ended after the game was won"}
    end

    @tag :pending
    test "Invalid board: players kept playing after a win" do
      board = """
      XXX
      OOO
      XOX
      """

      assert StateOfTicTacToe.game_state(board) ==
               {:error, "Impossible board: game should have ended after the game was won"}
    end
  end
end
