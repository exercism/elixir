if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bracket_push.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule BracketPushTest do
  use ExUnit.Case

  # @tag :skip
  test "empty string" do
    assert BracketPush.check_brackets("")
  end

  @tag :skip
  test "appropriate bracketing in a set of brackets" do
    assert BracketPush.check_brackets("{}")
  end

  @tag :skip
  test "unclosed brackets" do
    refute BracketPush.check_brackets("{{")
  end

  @tag :skip
  test "more than one pair of brackets" do
    assert BracketPush.check_brackets("{}[]")
  end

  @tag :skip
  test "brackets are out of order" do
    refute BracketPush.check_brackets("}{")
  end

  @tag :skip
  test "nested brackets" do
    assert BracketPush.check_brackets("{[()]}")
  end

  @tag :skip
  test "unbalanced nested brackets" do
    refute BracketPush.check_brackets("{[}]")
  end

  @tag :skip
  test "bracket closure with deeper nesting" do
    refute BracketPush.check_brackets("{[)][]}")
  end

  @tag :skip
  test "bracket closure in a long string of brackets" do
    assert BracketPush.check_brackets("{[]([()])}")
  end

  @tag :skip
  test "should ignore non-bracket characters" do
    assert BracketPush.check_brackets("{hello[]([a()])b}c")
  end

  @tag :skip
  test "string with newlines" do
    assert BracketPush.check_brackets("[]\n{()}\n[(({}))]\n")
  end
end
