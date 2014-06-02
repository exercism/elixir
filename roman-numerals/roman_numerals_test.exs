if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("roman.exs")
end

ExUnit.start

defmodule RomanTest do
  use ExUnit.Case, async: true

  test "1" do
    assert Roman.numerals(1) == "I"
  end

  test "2" do
    assert Roman.numerals(2) == "II"
  end

  test "3" do
    assert Roman.numerals(3) == "III"
  end

  test "4" do
    assert Roman.numerals(4) == "IV"
  end

  test "5" do
    assert Roman.numerals(5) == "V"
  end

  test "6" do
    assert Roman.numerals(6) == "VI"
  end

  test "9" do
    assert Roman.numerals(9) == "IX"
  end

  test "27" do
    assert Roman.numerals(27) == "XXVII"
  end

  test "48" do
    assert Roman.numerals(48) == "XLVIII"
  end

  test "59" do
    assert Roman.numerals(59) == "LIX"
  end

  test "93" do
    assert Roman.numerals(93) == "XCIII"
  end

  test "141" do
    assert Roman.numerals(141) == "CXLI"
  end

  test "163" do
    assert Roman.numerals(163) == "CLXIII"
  end

  test "402" do
    assert Roman.numerals(402) == "CDII"
  end

  test "575" do
    assert Roman.numerals(575) == "DLXXV"
  end

  test "911" do
    assert Roman.numerals(911) == "CMXI"
  end

  test "1024" do
    assert Roman.numerals(1024) == "MXXIV"
  end

  test "3000" do
    assert Roman.numerals(3000) == "MMM"
  end
end
