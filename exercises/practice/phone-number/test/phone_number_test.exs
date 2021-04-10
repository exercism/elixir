defmodule PhoneNumberTest do
  use ExUnit.Case

  describe "number" do
    test "cleans number" do
      assert PhoneNumber.clean("(223) 456-7890") == {:ok, "2234567890"}
    end

    @tag :pending
    test "cleans number with dots" do
      assert PhoneNumber.clean("223.456.7890") == {:ok, "2234567890"}
    end

    @tag :pending
    test "cleans numbers with multiple spaces" do
      assert PhoneNumber.clean("223 456   7890   ") == {:ok, "2234567890"}
    end

    @tag :pending
    test "invalid when 9 digits" do
      assert PhoneNumber.clean("212555010") == {:error, "incorrect number of digits"}
    end

    @tag :pending
    test "invalid when 11 digits does not start with a 1" do
      assert PhoneNumber.clean("22234567890") == {:error, "11 digits must start with 1"}
    end

    @tag :pending
    test "valid when 11 digits and first is 1" do
      assert PhoneNumber.clean("12234567890") == {:ok, "2234567890"}
    end

    @tag :pending
    test "valid when 11 digits and starting with 1 even with punctuation" do
      assert PhoneNumber.clean("+1 (223) 456-7890") == {:ok, "2234567890"}
    end

    @tag :pending
    test "invalid when more than 11 digits" do
      assert PhoneNumber.clean("321234567890") == {:error, "incorrect number of digits"}
    end

    @tag :pending
    test "invalid with letters" do
      assert PhoneNumber.clean("123-abc-7890") == {:error, "must contain digits only"}
    end

    @tag :pending
    test "invalid with punctuation other than separators" do
      assert PhoneNumber.clean("123-@:!-7890") == {:error, "must contain digits only"}
    end

    @tag :pending
    test "invalid if area code starts with 0" do
      assert PhoneNumber.clean("(023) 456-7890") == {:error, "area code cannot start with zero"}
    end

    @tag :pending
    test "invalid if area code starts with 1" do
      assert PhoneNumber.clean("(123) 456-7890") == {:error, "area code cannot start with one"}
    end

    @tag :pending
    test "invalid if exchange code starts with 0" do
      assert PhoneNumber.clean("(223) 056-7890") ==
               {:error, "exchange code cannot start with zero"}
    end

    @tag :pending
    test "invalid if exchange code starts with 1" do
      assert PhoneNumber.clean("(223) 156-7890") ==
               {:error, "exchange code cannot start with one"}
    end

    @tag :pending
    test "invalid if area code starts with 0 on valid 11-digit number" do
      assert PhoneNumber.clean("1 (023) 456-7890") == {:error, "area code cannot start with zero"}
    end

    @tag :pending
    test "invalid if area code starts with 1 on valid 11-digit number" do
      assert PhoneNumber.clean("1 (123) 456-7890") == {:error, "area code cannot start with one"}
    end

    @tag :pending
    test "invalid if exchange code starts with 0 on valid 11-digit number" do
      assert PhoneNumber.clean("1 (223) 056-7890") ==
               {:error, "exchange code cannot start with zero"}
    end

    @tag :pending
    test "invalid if exchange code starts with 1 on valid 11-digit number" do
      assert PhoneNumber.clean("1 (223) 156-7890") ==
               {:error, "exchange code cannot start with one"}
    end
  end
end
