defmodule RomanNumeralsTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert RomanNumerals.numeral(1) == "I"
  end

  @tag :pending
  test "2" do
    assert RomanNumerals.numeral(2) == "II"
  end

  @tag :pending
  test "3" do
    assert RomanNumerals.numeral(3) == "III"
  end

  @tag :pending
  test "4" do
    assert RomanNumerals.numeral(4) == "IV"
  end

  @tag :pending
  test "5" do
    assert RomanNumerals.numeral(5) == "V"
  end

  @tag :pending
  test "6" do
    assert RomanNumerals.numeral(6) == "VI"
  end

  @tag :pending
  test "9" do
    assert RomanNumerals.numeral(9) == "IX"
  end

  @tag :pending
  test "27" do
    assert RomanNumerals.numeral(27) == "XXVII"
  end

  @tag :pending
  test "48" do
    assert RomanNumerals.numeral(48) == "XLVIII"
  end

  @tag :pending
  test "59" do
    assert RomanNumerals.numeral(59) == "LIX"
  end

  @tag :pending
  test "93" do
    assert RomanNumerals.numeral(93) == "XCIII"
  end

  @tag :pending
  test "141" do
    assert RomanNumerals.numeral(141) == "CXLI"
  end

  @tag :pending
  test "163" do
    assert RomanNumerals.numeral(163) == "CLXIII"
  end

  @tag :pending
  test "402" do
    assert RomanNumerals.numeral(402) == "CDII"
  end

  @tag :pending
  test "575" do
    assert RomanNumerals.numeral(575) == "DLXXV"
  end

  @tag :pending
  test "911" do
    assert RomanNumerals.numeral(911) == "CMXI"
  end

  @tag :pending
  test "1024" do
    assert RomanNumerals.numeral(1024) == "MXXIV"
  end

  @tag :pending
  test "3000" do
    assert RomanNumerals.numeral(3000) == "MMM"
  end
end
