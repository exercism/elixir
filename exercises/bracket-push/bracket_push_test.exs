if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bracket_push.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule BracketPushTest do
  use ExUnit.Case

  # @tag :pending
  test "checks for appropriate bracketing in a set of brackets" do
    assert BracketPush.check_brackets("{}")
  end

  @tag :pending
  test "test for unclosed brackets" do
    refute BracketPush.check_brackets("{{")
  end

  @tag :pending
  test "test for more than one pair of brackets" do
    assert BracketPush.check_brackets("{}[]")
  end

  @tag :pending
  test "test fo brackets are out of order" do
    refute BracketPush.check_brackets("}{")
  end 

  @tag :pending
  test "test for nested brackets" do
    assert BracketPush.check_brackets("{[()]}")
  end  

  @tag :pending
  test "test to unbalanced nested brackets" do
    refute BracketPush.check_brackets("{[}]")
  end  

  @tag :pending
  test "checks bracket closure with deeper nesting" do
    refute BracketPush.check_brackets("{[)][]}")
  end

  @tag :pending
  test "checks bracket closure in a long string of brackets" do
    assert BracketPush.check_brackets("{[]([()])}")
  end 

  @tag :pending
  test "should ignore non-bracket characters" do
    assert BracketPush.check_brackets("{hello[]([a()])b}c")
  end 
end
