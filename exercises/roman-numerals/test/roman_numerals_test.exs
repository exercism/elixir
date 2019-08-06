defmodule RomanNumeralsTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert RomanNumerals.numerals(1) == "I"
  end

  @tag :pending
  test "2" do
    assert RomanNumerals.numerals(2) == "II"
  end

  @tag :pending
  test "3" do
    assert RomanNumerals.numerals(3) == "III"
  end

  @tag :pending
  test "4" do
    assert RomanNumerals.numerals(4) == "IV"
  end

  @tag :pending
  test "5" do
    assert RomanNumerals.numerals(5) == "V"
  end

  @tag :pending
  test "6" do
    assert RomanNumerals.numerals(6) == "VI"
  end

  @tag :pending
  test "9" do
    assert RomanNumerals.numerals(9) == "IX"
  end

  @tag :pending
  test "27" do
    assert RomanNumerals.numerals(27) == "XXVII"
  end

  @tag :pending
  test "48" do
    assert RomanNumerals.numerals(48) == "XLVIII"
  end

  @tag :pending
  test "59" do
    assert RomanNumerals.numerals(59) == "LIX"
  end

  @tag :pending
  test "93" do
    assert RomanNumerals.numerals(93) == "XCIII"
  end

  @tag :pending
  test "141" do
    assert RomanNumerals.numerals(141) == "CXLI"
  end

  @tag :pending
  test "163" do
    assert RomanNumerals.numerals(163) == "CLXIII"
  end

  @tag :pending
  test "402" do
    assert RomanNumerals.numerals(402) == "CDII"
  end

  @tag :pending
  test "575" do
    assert RomanNumerals.numerals(575) == "DLXXV"
  end

  @tag :pending
  test "911" do
    assert RomanNumerals.numerals(911) == "CMXI"
  end

  @tag :pending
  test "1024" do
    assert RomanNumerals.numerals(1024) == "MXXIV"
  end

  @tag :pending
  test "3000" do
    assert RomanNumerals.numerals(3000) == "MMM"
  end
end
