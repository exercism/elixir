if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bowling.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule BowlingTest do
  use ExUnit.Case

  defp roll_reduce(game, rolls) do
    Enum.reduce(rolls, game, fn(roll, game) -> Bowling.roll(game, roll) end)
  end

  test "can score all 0s" do
    game = Bowling.start
    rolls = [0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 0
  end

  @tag :pending
  test "can score an open frame" do
    game = Bowling.start
    rolls = [3, 4,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 7
  end

  @tag :pending
  test "can score multiple frames" do
    game = Bowling.start
    rolls = [3, 4,
             2, 3,
             5, 2,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 19
  end

  @tag :pending
  test "can score a game with all single pin rolls" do
    game = Bowling.start
    rolls = [1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1,
             1, 1]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 20
  end

  @tag :pending
  test "can score a game with all open frames" do
    game = Bowling.start
    rolls = [3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6,
             3, 6]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 90
  end

  @tag :pending
  test "can score a game with a strike not in the last frame" do
    game = Bowling.start
    rolls = [10,
             5, 3,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 26
  end

  @tag :pending
  test "can score a game with a spare not in the last frame" do
    game = Bowling.start
    rolls = [5, 5,
             3, 4,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 20
  end

  @tag :pending
  test "can score a game with multiple strikes in a row" do
    game = Bowling.start
    rolls = [10,
             10,
             10,
             5, 3,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 81
  end

  @tag :pending
  test "can score a game with multiple spares in a row" do
    game = Bowling.start
    rolls = [5, 5,
             3, 7,
             4, 1,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 32
  end

  @tag :pending
  test "fills out the last frame when there is a strike" do
    game = Bowling.start
    rolls = [0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             10,
             7, 1]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 18
  end

  @tag :pending
  test "fills out the last frame when there is a spare" do
    game = Bowling.start
    rolls = [0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             9, 1,
             7]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 17
  end

  @tag :pending
  test "allows filled balls to be strikes" do
    game = Bowling.start
    rolls = [0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             10,
             10,
             10]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 30
  end

  @tag :pending
  test "scores a perfect game correctly" do
    game = Bowling.start
    rolls = [10,
             10,
             10,
             10,
             10,
             10,
             10,
             10,
             10,
             10,
             10,
             10]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 300
  end

  @tag :pending
  test "does not allow negative rolls" do
    game = Bowling.start
    assert Bowling.roll(game, -1) == {:error, "Pins must have a value from 0 to 10"}
  end

  @tag :pending
  test "does not allow rolls greater than a strike" do
    game = Bowling.start
    assert Bowling.roll(game, 11) == {:error, "Pins must have a value from 0 to 10"}
  end

  @tag :pending
  test "does not allow consecutive rolls to be greater than a strike" do
    game = Bowling.start
    game = Bowling.roll(game, 5)
    assert Bowling.roll(game, 6) == {:error, "Pin count exceeds pins on the lane"}
  end

  @tag :pending
  test "does not allow pin count to be exeeded in last frame" do
    game = Bowling.start
    rolls = [0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             5]
    game = roll_reduce(game, rolls)
    assert Bowling.roll(game, 6) == {:error, "Pin count exceeds pins on the lane"}
  end

  @tag :pending
  test "score cannot be taken until the end of the game" do
    game = Bowling.start
    game = Bowling.roll(game, 0)
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end
end
