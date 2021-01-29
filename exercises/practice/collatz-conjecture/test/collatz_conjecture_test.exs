defmodule CollatzConjectureTest do
  use ExUnit.Case

  test "zero steps for one" do
    assert CollatzConjecture.calc(1) == 0
  end

  @tag :pending
  test "zero is an error" do
    assert_raise FunctionClauseError, fn -> CollatzConjecture.calc(0) end
  end

  @tag :pending
  test "divide if even" do
    assert CollatzConjecture.calc(16) == 4
  end

  @tag :pending
  test "even and odd steps" do
    assert CollatzConjecture.calc(12) == 9
  end

  @tag :pending
  test "Large number of even and odd steps" do
    assert CollatzConjecture.calc(1_000_000) == 152
  end

  @tag :pending
  test "start with odd step" do
    assert CollatzConjecture.calc(21) == 7
  end

  @tag :pending
  test "more steps than starting number" do
    assert CollatzConjecture.calc(7) == 16
  end

  @tag :pending
  test "negative value is an error " do
    assert_raise FunctionClauseError, fn -> CollatzConjecture.calc(-15) end
  end

  @tag :pending
  test "string as input value is an error " do
    assert_raise FunctionClauseError, fn -> CollatzConjecture.calc("fubar") end
  end
end
