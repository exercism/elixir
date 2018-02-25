if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("roman.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule RomanTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert Roman.numerals(1) == "I"
  end

  @tag :pending
  test "2" do
    assert Roman.numerals(2) == "II"
  end

  @tag :pending
  test "3" do
    assert Roman.numerals(3) == "III"
  end

  @tag :pending
  test "4" do
    assert Roman.numerals(4) == "IV"
  end

  @tag :pending
  test "5" do
    assert Roman.numerals(5) == "V"
  end

  @tag :pending
  test "6" do
    assert Roman.numerals(6) == "VI"
  end

  @tag :pending
  test "9" do
    assert Roman.numerals(9) == "IX"
  end

  @tag :pending
  test "27" do
    assert Roman.numerals(27) == "XXVII"
  end

  @tag :pending
  test "48" do
    assert Roman.numerals(48) == "XLVIII"
  end

  @tag :pending
  test "59" do
    assert Roman.numerals(59) == "LIX"
  end

  @tag :pending
  test "93" do
    assert Roman.numerals(93) == "XCIII"
  end

  @tag :pending
  test "141" do
    assert Roman.numerals(141) == "CXLI"
  end

  @tag :pending
  test "163" do
    assert Roman.numerals(163) == "CLXIII"
  end

  @tag :pending
  test "402" do
    assert Roman.numerals(402) == "CDII"
  end

  @tag :pending
  test "575" do
    assert Roman.numerals(575) == "DLXXV"
  end

  @tag :pending
  test "911" do
    assert Roman.numerals(911) == "CMXI"
  end

  @tag :pending
  test "1024" do
    assert Roman.numerals(1024) == "MXXIV"
  end

  @tag :pending
  test "3000" do
    assert Roman.numerals(3000) == "MMM"
  end
end
