defmodule IsogramTest do
  use ExUnit.Case

  # @tag :pending
  test "empty string" do
    assert Isogram.isogram?("")
  end

  @tag :pending
  test "isogram with only lower case characters" do
    assert Isogram.isogram?("isogram")
  end

  @tag :pending
  test "word with one duplicated character" do
    refute Isogram.isogram?("eleven")
  end

  @tag :pending
  test "word with one duplicated character from the end of the alphabet" do
    refute Isogram.isogram?("zzyzx")
  end

  @tag :pending
  test "longest reported english isogram" do
    assert Isogram.isogram?("subdermatoglyphic")
  end

  @tag :pending
  test "word with duplicated character in mixed case" do
    refute Isogram.isogram?("Alphabet")
  end

  @tag :pending
  test "word with duplicated character in mixed case, lowercase first" do
    refute Isogram.isogram?("alphAbet")
  end

  @tag :pending
  test "hypothetical isogrammic word with hyphen" do
    assert Isogram.isogram?("thumbscrew-japingly")
  end

  @tag :pending
  test "hypothetical word with duplicated character following hyphen" do
    refute Isogram.isogram?("thumbscrew-jappingly")
  end

  @tag :pending
  test "isogram with duplicated hyphen" do
    assert Isogram.isogram?("six-year-old")
  end

  @tag :pending
  test "made-up name that is an isogram" do
    assert Isogram.isogram?("Emily Jung Schwartzkopf")
  end

  @tag :pending
  test "duplicated character in the middle" do
    refute Isogram.isogram?("accentor")
  end

  @tag :pending
  test "same first and last characters" do
    refute Isogram.isogram?("angola")
  end

  @tag :pending
  test "word with duplicated character and with two hyphens" do
    refute Isogram.isogram?("up-to-date")
  end
end
