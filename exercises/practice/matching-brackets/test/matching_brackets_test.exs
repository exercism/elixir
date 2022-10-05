defmodule MatchingBracketsTest do
  use ExUnit.Case

  # @tag :pending
  test "paired square brackets" do
    assert MatchingBrackets.check_brackets("[]")
  end

  @tag :pending
  test "empty string" do
    assert MatchingBrackets.check_brackets("")
  end

  @tag :pending
  test "unpaired brackets" do
    refute MatchingBrackets.check_brackets("[[")
  end

  @tag :pending
  test "wrong ordered brackets" do
    refute MatchingBrackets.check_brackets("}{")
  end

  @tag :pending
  test "wrong closing bracket" do
    refute MatchingBrackets.check_brackets("{]")
  end

  @tag :pending
  test "paired with whitespace" do
    assert MatchingBrackets.check_brackets("{ }")
  end

  @tag :pending
  test "partially paired brackets" do
    refute MatchingBrackets.check_brackets("{[])")
  end

  @tag :pending
  test "simple nested brackets" do
    assert MatchingBrackets.check_brackets("{[]}")
  end

  @tag :pending
  test "several paired brackets" do
    assert MatchingBrackets.check_brackets("{}[]")
  end

  @tag :pending
  test "paired and nested brackets" do
    assert MatchingBrackets.check_brackets("([{}({}[])])")
  end

  @tag :pending
  test "unopened closing brackets" do
    refute MatchingBrackets.check_brackets("{[)][]}")
  end

  @tag :pending
  test "unpaired and nested brackets" do
    refute MatchingBrackets.check_brackets("([{])")
  end

  @tag :pending
  test "paired and wrong nested brackets" do
    refute MatchingBrackets.check_brackets("[({]})")
  end

  @tag :pending
  test "paired and wrong nested brackets but innermost are correct" do
    refute MatchingBrackets.check_brackets("[({}])")
  end

  @tag :pending
  test "paired and incomplete brackets" do
    refute MatchingBrackets.check_brackets("{}[")
  end

  @tag :pending
  test "too many closing brackets" do
    refute MatchingBrackets.check_brackets("[]]")
  end

  @tag :pending
  test "early unexpected brackets" do
    refute MatchingBrackets.check_brackets(")()")
  end

  @tag :pending
  test "early mismatched brackets" do
    refute MatchingBrackets.check_brackets("{)()")
  end

  @tag :pending
  test "math expression" do
    assert MatchingBrackets.check_brackets("(((185 + 223.85) * 15) - 543)/2")
  end

  @tag :pending
  test "complex latex expression" do
    assert MatchingBrackets.check_brackets(
             "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
           )
  end
end
