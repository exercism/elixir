if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("ocr_numbers.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule OCRNumbersTest do
  use ExUnit.Case

  # @tag :pending
  test "Recognizes 0" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "| |",
        "|_|",
        "   "
      ]
    )
    assert number == "0"
  end

  @tag :pending
  test "Recognizes 1" do
    number = OCRNumbers.convert(
      [
        "   ",
        "  |",
        "  |",
        "   "
      ]
    )

    assert number == "1"
  end

  @tag :pending
  test "Unreadable but correctly sized inputs return ?" do
    number = OCRNumbers.convert(
      [
        "   ",
        "  _",
        "  |",
        "   "
      ]
    )

    assert number == "?"
  end

  @tag :pending
  test "Input with a number of lines that is not a multiple of four raises an error" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "| |",
        "   "
      ]
    )

    assert number == -1
  end

  @tag :pending
  test "Input with a number of columns that is not a multiple of three raises an error" do
    number = OCRNumbers.convert(
      [
        "    ",
        "   |",
        "   |",
        "    "
      ]
    )

    assert number == -1
  end

  @tag :pending
  test "Recognizes 110101100" do
    number = OCRNumbers.convert(
      [
        "       _     _        _  _ ",
        "  |  || |  || |  |  || || |",
        "  |  ||_|  ||_|  |  ||_||_|",
        "                           "
      ]
    )

    assert number == "110101100"
  end

  @tag :pending
  test "Garbled numbers in a string are replaced with ?" do
    number = OCRNumbers.convert(
      [
        "       _     _           _ ",
        "  |  || |  || |     || || |",
        "  |  | _|  ||_|  |  ||_||_|",
        "                           "
      ]
    )

    assert number == "11?10?1?0"
  end

  @tag :pending
  test "Recognizes 2" do
    number = OCRNumbers.convert(
      [
        " _ ",
        " _|",
        "|_ ",
        "   "
      ]
    )

    assert number == "2"
  end

  @tag :pending
  test "Recognizes 3" do
    number = OCRNumbers.convert(
      [
        " _ ",
        " _|",
        " _|",
        "   "
      ]
    )

    assert number == "3"
  end

  @tag :pending
  test "Recognizes 4" do
    number = OCRNumbers.convert(
      [
        "   ",
        "|_|",
        "  |",
        "   "
      ]
    )

    assert number == "4"
  end

  @tag :pending
  test "Recognized 5" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "|_ ",
        " _|",
        "   "
      ]
    )

    assert number == "5"
  end

  @tag :pending
  test "Recognized 6" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "|_ ",
        "|_|",
        "   "
      ]
    )

    assert number == "6"
  end

  @tag :pending
  test "Regonizes 7" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "  |",
        "  |",
        "   "
      ]
    )

    assert number == "7"
  end

  @tag :pending
  test "Recognizes 8" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "|_|",
        "|_|",
        "   "
      ]
    )

    assert number == "8"
  end

  @tag :pending
  test "Recognizes 9" do
    number = OCRNumbers.convert(
      [
        " _ ",
        "|_|",
        " _|",
        "   "
      ]
    )

    assert number == "9"
  end

  @tag :pending
  test "Recognizes string of decimal numbers" do
    number = OCRNumbers.convert(
      [
        "    _  _     _  _  _  _  _  _ ",
        "  | _| _||_||_ |_   ||_||_|| |",
        "  ||_  _|  | _||_|  ||_| _||_|",
        "                              "
      ]
    )

    assert number == "1234567890"
  end

  @tag :pending
  test "Numbers separated by empty lines are recognized. Lines are joined by commas." do
    number = OCRNumbers.convert(
      [
        "    _  _ ",
        "  | _| _|",
        "  ||_  _|",
        "         ",
        "    _  _ ",
        "|_||_ |_ ",
        "  | _||_|",
        "         ",
        " _  _  _ ",
        "  ||_||_|",
        "  ||_| _|",
        "         "
      ]
    )

    assert number == "123,456,789"
  end
end
