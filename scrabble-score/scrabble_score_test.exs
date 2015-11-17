if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("scrabble.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ScrabbleScoreTest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "empty word scores zero" do
    assert Scrabble.score("") == 0
  end

  @tag :pending
  test "whitespace scores zero" do
    assert Scrabble.score(" \t\n") == 0
  end

  @tag :pending
  test "scores very short word" do
    assert Scrabble.score("a") == 1
  end

  @tag :pending
  test "scores other very short word" do
    assert Scrabble.score("f") == 4
  end

  @tag :pending
  test "simple word scores the number of letters" do
    assert Scrabble.score("street") == 6
  end

  @tag :pending
  test "complicated word scores more" do
    assert Scrabble.score("quirky") == 22
  end

  @tag :pending
  test "scores are case insensitive" do
    assert Scrabble.score("MULTIBILLIONAIRE") == 20
  end

  @tag :pending
  test "convenient scoring" do
    assert Scrabble.score("alacrity") == 13
  end
end
