if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("roman.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule RomanTest do
  use ExUnit.Case

  # @tag :skip
  test "1" do
    assert Roman.numerals(1) == "I"
  end

  @tag :skip
  test "2" do
    assert Roman.numerals(2) == "II"
  end

  @tag :skip
  test "3" do
    assert Roman.numerals(3) == "III"
  end

  @tag :skip
  test "4" do
    assert Roman.numerals(4) == "IV"
  end

  @tag :skip
  test "5" do
    assert Roman.numerals(5) == "V"
  end

  @tag :skip
  test "6" do
    assert Roman.numerals(6) == "VI"
  end

  @tag :skip
  test "9" do
    assert Roman.numerals(9) == "IX"
  end

  @tag :skip
  test "27" do
    assert Roman.numerals(27) == "XXVII"
  end

  @tag :skip
  test "48" do
    assert Roman.numerals(48) == "XLVIII"
  end

  @tag :skip
  test "59" do
    assert Roman.numerals(59) == "LIX"
  end

  @tag :skip
  test "93" do
    assert Roman.numerals(93) == "XCIII"
  end

  @tag :skip
  test "141" do
    assert Roman.numerals(141) == "CXLI"
  end

  @tag :skip
  test "163" do
    assert Roman.numerals(163) == "CLXIII"
  end

  @tag :skip
  test "402" do
    assert Roman.numerals(402) == "CDII"
  end

  @tag :skip
  test "575" do
    assert Roman.numerals(575) == "DLXXV"
  end

  @tag :skip
  test "911" do
    assert Roman.numerals(911) == "CMXI"
  end

  @tag :skip
  test "1024" do
    assert Roman.numerals(1024) == "MXXIV"
  end

  @tag :skip
  test "3000" do
    assert Roman.numerals(3000) == "MMM"
  end
end
