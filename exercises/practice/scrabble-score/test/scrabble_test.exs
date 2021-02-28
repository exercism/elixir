defmodule ScrabbleTest do
  use ExUnit.Case

  # @tag :pending
  test "empty word scores zero" do
    assert Scrabble.score("") == 0
  end

  @tag :pending
  test "whitespace scores zero" do
    assert Scrabble.score(" \t\n") == 0
  end

  @tag :pending
  test "uppercase letter" do
    assert Scrabble.score("A") == 1
  end

  @tag :pending
  test "valuable letter" do
    assert Scrabble.score("f") == 4
  end

  @tag :pending
  test "short word" do
    assert Scrabble.score("at") == 2
  end

  @tag :pending
  test "short, valuable word" do
    assert Scrabble.score("zoo") == 12
  end

  @tag :pending
  test "medium word" do
    assert Scrabble.score("street") == 6
  end

  @tag :pending
  test "medium, valuable word" do
    assert Scrabble.score("quirky") == 22
  end

  @tag :pending
  test "long, mixed-case word" do
    assert Scrabble.score("OxyphenButazone") == 41
  end

  @tag :pending
  test "english-like word" do
    assert Scrabble.score("pinata") == 8
  end

  @tag :pending
  test "entire alphabet available" do
    assert Scrabble.score("abcdefghijklmnopqrstuvwxyz") == 87
  end
end
