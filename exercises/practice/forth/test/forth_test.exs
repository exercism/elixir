defmodule ForthTest do
  use ExUnit.Case

  # @tag :pending
  test "no input, no stack" do
    s = Forth.new() |> Forth.format_stack()
    assert s == ""
  end

  @tag :pending
  test "numbers just get pushed onto the stack" do
    s =
      Forth.new()
      |> Forth.eval("1 2 3 4 5")
      |> Forth.format_stack()

    assert s == "1 2 3 4 5"
  end

  @tag :pending
  test "non-word characters are separators" do
    # Note the Ogham Space Mark ( ), this is a spacing character.
    s =
      Forth.new()
      |> Forth.eval("1\x002\x013\n4\r5 6\t7")
      |> Forth.format_stack()

    assert s == "1 2 3 4 5 6 7"
  end

  @tag :pending
  test "basic arithmetic" do
    s =
      Forth.new()
      |> Forth.eval("1 2 + 4 -")
      |> Forth.format_stack()

    assert s == "-1"
    # integer division
    s =
      Forth.new()
      |> Forth.eval("2 4 * 3 /")
      |> Forth.format_stack()

    assert s == "2"
  end

  @tag :pending
  test "division by zero" do
    assert_raise Forth.DivisionByZero, fn ->
      Forth.new() |> Forth.eval("4 2 2 - /")
    end
  end

  @tag :pending
  test "dup" do
    s =
      Forth.new()
      |> Forth.eval("1 DUP")
      |> Forth.format_stack()

    assert s == "1 1"

    s =
      Forth.new()
      |> Forth.eval("1 2 Dup")
      |> Forth.format_stack()

    assert s == "1 2 2"

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("dup")
    end
  end

  @tag :pending
  test "drop" do
    s =
      Forth.new()
      |> Forth.eval("1 drop")
      |> Forth.format_stack()

    assert s == ""

    s =
      Forth.new()
      |> Forth.eval("1 2 drop")
      |> Forth.format_stack()

    assert s == "1"

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("drop")
    end
  end

  @tag :pending
  test "swap" do
    s =
      Forth.new()
      |> Forth.eval("1 2 swap")
      |> Forth.format_stack()

    assert s == "2 1"

    s =
      Forth.new()
      |> Forth.eval("1 2 3 swap")
      |> Forth.format_stack()

    assert s == "1 3 2"

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("1 swap")
    end

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("swap")
    end
  end

  @tag :pending
  test "over" do
    s =
      Forth.new()
      |> Forth.eval("1 2 over")
      |> Forth.format_stack()

    assert s == "1 2 1"

    s =
      Forth.new()
      |> Forth.eval("1 2 3 over")
      |> Forth.format_stack()

    assert s == "1 2 3 2"

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("1 over")
    end

    assert_raise Forth.StackUnderflow, fn ->
      Forth.new() |> Forth.eval("over")
    end
  end

  @tag :pending
  test "defining a new word" do
    s =
      Forth.new()
      |> Forth.eval(": dup-twice dup dup ;")
      |> Forth.eval("1 dup-twice")
      |> Forth.format_stack()

    assert s == "1 1 1"
  end

  @tag :pending
  test "redefining an existing word" do
    s =
      Forth.new()
      |> Forth.eval(": foo dup ;")
      |> Forth.eval(": foo dup dup ;")
      |> Forth.eval("1 foo")
      |> Forth.format_stack()

    assert s == "1 1 1"
  end

  @tag :pending
  test "redefining an existing built-in word" do
    s =
      Forth.new()
      |> Forth.eval(": swap dup ;")
      |> Forth.eval("1 swap")
      |> Forth.format_stack()

    assert s == "1 1"
  end

  @tag :pending
  test "defining words with odd characters" do
    s =
      Forth.new()
      |> Forth.eval(": € 220371 ; €")
      |> Forth.format_stack()

    assert s == "220371"
  end

  @tag :pending
  test "defining a number" do
    assert_raise Forth.InvalidWord, fn ->
      Forth.new() |> Forth.eval(": 1 2 ;")
    end
  end

  @tag :pending
  test "calling a non-existing word" do
    assert_raise Forth.UnknownWord, fn ->
      Forth.new() |> Forth.eval("1 foo")
    end
  end
end
