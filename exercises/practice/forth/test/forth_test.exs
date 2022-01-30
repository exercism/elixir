defmodule ForthTest do
  use ExUnit.Case

  describe "parsing and numbers" do
    # @tag :pending
    test "no input, no stack" do
      s = Forth.new() |> Forth.format_stack()
      assert s == ""
    end

    @tag :pending
    test "pushes negative numbers onto the stack" do
      s =
        Forth.new()
        |> Forth.eval("-1 -2 -3 -4 -5")
        |> Forth.format_stack()

      assert s == "-1 -2 -3 -4 -5"
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
  end

  describe "addition" do
    @tag :pending
    test "can add two numbers" do
      s =
        Forth.new()
        |> Forth.eval("1 2 +")
        |> Forth.format_stack()

      assert s == "3"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("+")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 +")
      end
    end
  end

  describe "subtraction" do
    @tag :pending
    test "can subtract two numbers" do
      s =
        Forth.new()
        |> Forth.eval("3 4 -")
        |> Forth.format_stack()

      assert s == "-1"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("-")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 -")
      end
    end
  end

  describe "multiplication" do
    @tag :pending
    test "can multiply two numbers" do
      s =
        Forth.new()
        |> Forth.eval("2 4 *")
        |> Forth.format_stack()

      assert s == "8"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("*")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 *")
      end
    end
  end

  describe "division" do
    @tag :pending
    test "can divide two numbers" do
      s =
        Forth.new()
        |> Forth.eval("12 3 /")
        |> Forth.format_stack()

      assert s == "4"
    end

    @tag :pending
    test "performs integer division" do
      s =
        Forth.new()
        |> Forth.eval("8 3 /")
        |> Forth.format_stack()

      assert s == "2"
    end

    @tag :pending
    test "raises if dividing by zero" do
      assert_raise Forth.DivisionByZero, fn ->
        Forth.new() |> Forth.eval("4 0 /")
      end
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("/")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 /")
      end
    end
  end

  describe "combined arithmetic" do
    @tag :pending
    test "addition and subtraction" do
      s =
        Forth.new()
        |> Forth.eval("1 2 + 4 -")
        |> Forth.format_stack()

      assert s == "-1"
    end

    @tag :pending
    test "multiplication and division" do
      s =
        Forth.new()
        |> Forth.eval("2 4 * 3 /")
        |> Forth.format_stack()

      assert s == "2"
    end
  end

  describe "dup" do
    @tag :pending
    test "copies a value on the stack" do
      s =
        Forth.new()
        |> Forth.eval("1 dup")
        |> Forth.format_stack()

      assert s == "1 1"
    end

    @tag :pending
    test "copies the top value on the stack" do
      s =
        Forth.new()
        |> Forth.eval("1 2 dup")
        |> Forth.format_stack()

      assert s == "1 2 2"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("dup")
      end
    end
  end

  describe "drop" do
    @tag :pending
    test "removes the top value on the stack if it is the only one" do
      s =
        Forth.new()
        |> Forth.eval("1 drop")
        |> Forth.format_stack()

      assert s == ""
    end

    @tag :pending
    test "removes the top value on the stack if it is not the only one" do
      s =
        Forth.new()
        |> Forth.eval("1 2 drop")
        |> Forth.format_stack()

      assert s == "1"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("drop")
      end
    end
  end

  describe "swap" do
    @tag :pending
    test "swaps the top two values on the stack if they are the only ones" do
      s =
        Forth.new()
        |> Forth.eval("1 2 swap")
        |> Forth.format_stack()

      assert s == "2 1"
    end

    @tag :pending
    test "swaps the top two values on the stack if they are not the only ones" do
      s =
        Forth.new()
        |> Forth.eval("1 2 3 swap")
        |> Forth.format_stack()

      assert s == "1 3 2"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 swap")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("swap")
      end
    end
  end

  describe "over" do
    @tag :pending
    test "copies the second element if there are only two" do
      s =
        Forth.new()
        |> Forth.eval("1 2 over")
        |> Forth.format_stack()

      assert s == "1 2 1"
    end

    @tag :pending
    test "copies the second element if there are more than two" do
      s =
        Forth.new()
        |> Forth.eval("1 2 3 over")
        |> Forth.format_stack()

      assert s == "1 2 3 2"
    end

    @tag :pending
    test "raises if there is nothing on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("1 over")
      end
    end

    @tag :pending
    test "raises if there is only one value on the stack" do
      assert_raise Forth.StackUnderflow, fn ->
        Forth.new() |> Forth.eval("over")
      end
    end
  end

  describe "user-defined words" do
    @tag :pending
    test "can consist of built-in words" do
      s =
        Forth.new()
        |> Forth.eval(": dup-twice dup dup ;")
        |> Forth.eval("1 dup-twice")
        |> Forth.format_stack()

      assert s == "1 1 1"
    end

    @tag :pending
    test "execute in the right order" do
      s =
        Forth.new()
        |> Forth.eval(": countup 1 2 3 ;")
        |> Forth.eval("countup")
        |> Forth.format_stack()

      assert s == "1 2 3"
    end

    @tag :pending
    test "can override other user-defined words" do
      s =
        Forth.new()
        |> Forth.eval(": foo dup ;")
        |> Forth.eval(": foo dup dup ;")
        |> Forth.eval("1 foo")
        |> Forth.format_stack()

      assert s == "1 1 1"
    end

    @tag :pending
    test "can override built-in words" do
      s =
        Forth.new()
        |> Forth.eval(": swap dup ;")
        |> Forth.eval("1 swap")
        |> Forth.format_stack()

      assert s == "1 1"
    end

    @tag :pending
    test "can override built-in operators" do
      s =
        Forth.new()
        |> Forth.eval(": + * ;")
        |> Forth.eval("3 4 +")
        |> Forth.format_stack()

      assert s == "12"
    end

    @tag :pending
    test "can use different words with the same name" do
      s =
        Forth.new()
        |> Forth.eval(": foo 5 ;")
        |> Forth.eval(": bar foo ;")
        |> Forth.eval(": foo 6 ;")
        |> Forth.eval("bar foo")
        |> Forth.format_stack()

      assert s == "5 6"
    end

    @tag :pending
    test "can define word that uses word with the same name" do
      s =
        Forth.new()
        |> Forth.eval(": foo 10 ;")
        |> Forth.eval(": foo foo 1 + ;")
        |> Forth.eval("foo")
        |> Forth.format_stack()

      assert s == "11"
    end

    @tag :pending
    test "can define word with odd characters" do
      s =
        Forth.new()
        |> Forth.eval(": € 220371 ; €")
        |> Forth.format_stack()

      assert s == "220371"
    end

    @tag :pending
    test "cannot redefine numbers" do
      assert_raise Forth.InvalidWord, fn ->
        Forth.new() |> Forth.eval(": 1 2 ;")
      end
    end

    @tag :pending
    test "cannot redefine negative numbers" do
      assert_raise Forth.InvalidWord, fn ->
        Forth.new() |> Forth.eval(": -1 2 ;")
      end
    end

    @tag :pending
    test "raises if executing a non-existent word" do
      assert_raise Forth.UnknownWord, fn ->
        Forth.new() |> Forth.eval("foo")
      end
    end

    @tag :pending
    test "only defines locally" do
      s =
        Forth.new()
        |> Forth.eval(": + - ;")
        |> Forth.eval("1 1 +")
        |> Forth.format_stack()

      assert s == "0"

      s =
        Forth.new()
        |> Forth.eval("1 1 +")
        |> Forth.format_stack()

      assert s == "2"
    end
  end

  describe "case-insensitivity" do
    @tag :pending
    test "DUP is case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval("1 DUP Dup dup")
        |> Forth.format_stack()

      assert s == "1 1 1 1"
    end

    @tag :pending
    test "DROP is case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval("1 2 3 4 DROP Drop drop")
        |> Forth.format_stack()

      assert s == "1"
    end

    @tag :pending
    test "SWAP is case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval("1 2 SWAP 3 Swap 4 swap")
        |> Forth.format_stack()

      assert s == "2 3 4 1"
    end

    @tag :pending
    test "OVER is case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval("1 2 OVER Over over")
        |> Forth.format_stack()

      assert s == "1 2 1 2 1"
    end

    @tag :pending
    test "user-defined words are case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval(": foo dup ;")
        |> Forth.eval("1 FOO Foo foo")
        |> Forth.format_stack()

      assert s == "1 1 1 1"
    end

    @tag :pending
    test "definitions are case-insensitive" do
      s =
        Forth.new()
        |> Forth.eval(": SWAP DUP Dup dup ;")
        |> Forth.eval("1 swap")
        |> Forth.format_stack()

      assert s == "1 1 1 1"
    end
  end
end
