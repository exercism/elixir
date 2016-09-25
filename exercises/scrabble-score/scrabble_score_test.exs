if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("scrabble.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule ScrabbleScoreTest do
  use ExUnit.Case

  # @tag :skip
  test "empty word scores zero" do
    assert Scrabble.score("") == 0
  end

  @tag :skip
  test "whitespace scores zero" do
    assert Scrabble.score(" \t\n") == 0
  end

  @tag :skip
  test "scores very short word" do
    assert Scrabble.score("a") == 1
  end

  @tag :skip
  test "scores other very short word" do
    assert Scrabble.score("f") == 4
  end

  @tag :skip
  test "simple word scores the number of letters" do
    assert Scrabble.score("street") == 6
  end

  @tag :skip
  test "complicated word scores more" do
    assert Scrabble.score("quirky") == 22
  end

  @tag :skip
  test "scores are case insensitive" do
    assert Scrabble.score("OXYPHENBUTAZONE") == 41
  end

  @tag :skip
  test "convenient scoring" do
    assert Scrabble.score("alacrity") == 13
  end
end
