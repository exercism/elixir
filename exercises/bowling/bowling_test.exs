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
  test "can score a game with no strikes or spares" do
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
  test "spare followed by all 0s is worth 10 points" do
    game = Bowling.start
    rolls = [6, 4,
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
    assert Bowling.score(game) == 10
  end

  @tag :pending
  test "points scored in the roll after the spare are counted twice" do
    game = Bowling.start
    rolls = [6, 4,
             3, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 16
  end

  @tag :pending
  test "consecutive spares each get a one roll bonus" do
    game = Bowling.start
    rolls = [5, 5,
             3, 7,
             4, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0,
             0, 0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 31
  end

  @tag :pending
  test "a spare in the last frame gets a one roll bonus that is counted once" do
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
             7, 3,
             7]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 17
  end

  @tag :pending
  test "a strike earns ten points in frame with a single roll" do
    game = Bowling.start
    rolls = [10,
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
    assert Bowling.score(game) == 10
  end

  @tag :pending
  test "points scored in the two rolls after a strike are counted twice as a bonus" do
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
  test "consecutive strikes each get the two roll bonus" do
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
  test "a strike in the last frame gets a two roll bonus that is counted once" do
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
  test "rolling a spare with the two roll bonus does not get a bonus roll" do
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
             7, 3]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 20
  end

  @tag :pending
  test "strikes with the two roll bonus do not get bonus rolls" do
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
  test "a strike with the one roll bonus after a spare in the last frame does not get a bonus" do
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
             7, 3,
             10]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == 20
  end

  @tag :pending
  test "all strikes is a perfect game" do
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
  test "rolls can not score negative points" do
    game = Bowling.start
    assert Bowling.roll(game, -1) == {:error, "Pins must have a value from 0 to 10"}
  end

  @tag :pending
  test "a roll can not score more than 10 points" do
    game = Bowling.start
    assert Bowling.roll(game, 11) == {:error, "Pins must have a value from 0 to 10"}
  end

  @tag :pending
  test "two rolls in a frame can not score more than 10 points" do
    game = Bowling.start
    game = Bowling.roll(game, 5)
    assert Bowling.roll(game, 6) == {:error, "Pin count exceeds pins on the lane"}
  end

  @tag :pending
  test "two bonus rolls after a strike in the last frame can not score more than 10 points" do
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
  test "an unstarted game can not be scored" do
    game = Bowling.start
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end

  @tag :pending
  test "score cannot be taken until the end of the game" do
    game = Bowling.start
    game = Bowling.roll(game, 0)
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end

  @tag :pending
  test "a game with more than ten frames can not be scored" do
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
             0, 0,
             0]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == {:error, "Invalid game: too many frames"}
  end

  @tag :pending
  test "bonus rolls for a strike in the last frame must be rolled before score can be calculated" do
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
             10]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end

  @tag :pending
  test "both bonus rolls for a strike in the last frame must be rolled before score can be calculated" do
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
             10]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end

  @tag :pending
  test "bonus roll for a spare in the last frame must be rolled before score can be calculated" do
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
             7, 3]
    game = roll_reduce(game, rolls)
    assert Bowling.score(game) == {:error, "Score cannot be taken until the end of the game"}
  end
end
