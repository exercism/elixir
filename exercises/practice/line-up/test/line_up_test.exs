defmodule LineUpTest do
  use ExUnit.Case

  # @tag :pending
  test "format smallest non-exceptional ordinal numeral 4" do
    assert LineUp.format("Gianna", 4) ==
             "Gianna, you are the 4th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format greatest single digit non-exceptional ordinal numeral 9" do
    assert LineUp.format("Maarten", 9) ==
             "Maarten, you are the 9th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 5" do
    assert LineUp.format("Petronila", 5) ==
             "Petronila, you are the 5th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 6" do
    assert LineUp.format("Attakullakulla", 6) ==
             "Attakullakulla, you are the 6th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 7" do
    assert LineUp.format("Kate", 7) == "Kate, you are the 7th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 8" do
    assert LineUp.format("Maximiliano", 8) ==
             "Maximiliano, you are the 8th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 1" do
    assert LineUp.format("Mary", 1) == "Mary, you are the 1st customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 2" do
    assert LineUp.format("Haruto", 2) ==
             "Haruto, you are the 2nd customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 3" do
    assert LineUp.format("Henriette", 3) ==
             "Henriette, you are the 3rd customer we serve today. Thank you!"
  end

  @tag :pending
  test "format smallest two digit non-exceptional ordinal numeral 10" do
    assert LineUp.format("Alvarez", 10) ==
             "Alvarez, you are the 10th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 11" do
    assert LineUp.format("Jacqueline", 11) ==
             "Jacqueline, you are the 11th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 12" do
    assert LineUp.format("Juan", 12) ==
             "Juan, you are the 12th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 13" do
    assert LineUp.format("Patricia", 13) ==
             "Patricia, you are the 13th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 21" do
    assert LineUp.format("Washi", 21) ==
             "Washi, you are the 21st customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 62" do
    assert LineUp.format("Nayra", 62) ==
             "Nayra, you are the 62nd customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 100" do
    assert LineUp.format("John", 100) ==
             "John, you are the 100th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 101" do
    assert LineUp.format("Zeinab", 101) ==
             "Zeinab, you are the 101st customer we serve today. Thank you!"
  end

  @tag :pending
  test "format non-exceptional ordinal numeral 112" do
    assert LineUp.format("Knud", 112) ==
             "Knud, you are the 112th customer we serve today. Thank you!"
  end

  @tag :pending
  test "format exceptional ordinal numeral 123" do
    assert LineUp.format("Yma", 123) ==
             "Yma, you are the 123rd customer we serve today. Thank you!"
  end
end
