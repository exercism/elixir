if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bracket_push.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule BracketPushTest do
  use ExUnit.Case

  # @tag :pending
  test "paired square brackets" do
    assert BracketPush.check_brackets("[]")
  end

  @tag :pending
  test "empty string" do
    assert BracketPush.check_brackets("")
  end

  @tag :pending
  test "unpaired brackets" do
    refute BracketPush.check_brackets("[[")
  end

  @tag :pending
  test "wrong ordered brackets" do
    refute BracketPush.check_brackets("}{")
  end

  @tag :pending
  test "wrong closing bracket" do
    refute BracketPush.check_brackets("{]")
  end

  @tag :pending
  test "paired with whitespace" do
    assert BracketPush.check_brackets("{ }")
  end

  @tag :pending
  test "simple nested brackets" do
    assert BracketPush.check_brackets("{[]}")
  end

  @tag :pending
  test "several paired brackets" do
    assert BracketPush.check_brackets("{}[]")
  end

  @tag :pending
  test "paired and nested brackets" do
    assert BracketPush.check_brackets("([{}({}[])])")
  end

  @tag :pending
  test "unopened closing brackets" do
    refute BracketPush.check_brackets("{[)][]}")
  end

  @tag :pending
  test "unpaired and nested brackets" do
    refute BracketPush.check_brackets("([{])")
  end

  @tag :pending
  test "paired and wrong nested brackets" do
    refute BracketPush.check_brackets("[({]})")
  end

  @tag :pending
  test "math expression" do
    assert BracketPush.check_brackets("(((185 + 223.85) * 15) - 543)/2")
  end

  @tag :pending
  test "complex latex expression" do
    assert BracketPush.check_brackets(
             "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
           )
  end
end
