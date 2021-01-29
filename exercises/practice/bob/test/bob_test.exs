defmodule BobTest do
  use ExUnit.Case

  test "stating something" do
    assert Bob.hey("Tom-ay-to, tom-aaaah-to.") == "Whatever."
  end

  @tag :pending
  test "shouting" do
    assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
  end

  @tag :pending
  test "shouting gibberish" do
    assert Bob.hey("FCECDFCAAB") == "Whoa, chill out!"
  end

  @tag :pending
  test "asking a question" do
    assert Bob.hey("Does this cryogenic chamber make me look fat?") == "Sure."
  end

  @tag :pending
  test "asking a numeric question" do
    assert Bob.hey("You are, what, like 15?") == "Sure."
  end

  @tag :pending
  test "asking gibberish" do
    assert Bob.hey("fffbbcbeab?") == "Sure."
  end

  @tag :pending
  test "talking forcefully" do
    assert Bob.hey("Hi there!") == "Whatever."
  end

  @tag :pending
  test "using acronyms in regular speech" do
    assert Bob.hey("It's OK if you don't want to go to the DMV.") == "Whatever."
  end

  @tag :pending
  test "talking in capitals" do
    assert Bob.hey("This Isn't Shouting!") == "Whatever."
  end

  @tag :pending
  test "forceful question" do
    assert Bob.hey("WHAT'S GOING ON?") == "Calm down, I know what I'm doing!"
  end

  @tag :pending
  test "asking in capitals" do
    assert Bob.hey("THIS ISN'T SHOUTING?") == "Calm down, I know what I'm doing!"
  end

  @tag :pending
  test "shouting numbers" do
    assert Bob.hey("1, 2, 3 GO!") == "Whoa, chill out!"
  end

  @tag :pending
  test "shouting with special characters" do
    assert Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!"
  end

  @tag :pending
  test "shouting with no exclamation mark" do
    assert Bob.hey("I HATE THE DENTIST") == "Whoa, chill out!"
  end

  @tag :pending
  test "statement containing question mark" do
    assert Bob.hey("Ending with ? means a question.") == "Whatever."
  end

  @tag :pending
  test "silence" do
    assert Bob.hey("") == "Fine. Be that way!"
  end

  @tag :pending
  test "prolonged silence" do
    assert Bob.hey("  ") == "Fine. Be that way!"
  end

  @tag :pending
  test "alternate silence" do
    assert Bob.hey("\t\t\t\t\t\t\t\t\t\t") == "Fine. Be that way!"
  end

  @tag :pending
  test "only numbers" do
    assert Bob.hey("1, 2, 3") == "Whatever."
  end

  @tag :pending
  test "multiple line question" do
    assert Bob.hey("\nDoes this cryogenic chamber make me look fat?\nNo.") == "Whatever."
  end

  @tag :pending
  test "question with numbers" do
    assert Bob.hey("4?") == "Sure."
  end

  @tag :pending
  test "non-letters with question" do
    assert Bob.hey(":) ?") == "Sure."
  end

  @tag :pending
  test "prattling on" do
    assert Bob.hey("Wait! Hang on. Are you going to be OK?") == "Sure."
  end

  @tag :pending
  test "starting with whitespace" do
    assert Bob.hey("         hmmmmmmm...") == "Whatever."
  end

  @tag :pending
  test "ending with whitespace" do
    assert Bob.hey("Okay if like my  spacebar  quite a bit?   ") == "Sure."
  end

  @tag :pending
  test "other whitespace" do
    assert Bob.hey("\n\r \t") == "Fine. Be that way!"
  end

  @tag :pending
  test "non-question ending with whitespace" do
    assert Bob.hey("This is a statement ending with whitespace     ") == "Whatever."
  end

  @tag :pending
  test "shouting in Russian" do
    assert Bob.hey("УХОДИ") == "Whoa, chill out!"
  end
end
