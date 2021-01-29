defmodule OcrNumbersTest do
  use ExUnit.Case

  # @tag :pending
  test "Recognizes 0" do
    number =
      OcrNumbers.convert([
        " _ ",
        "| |",
        "|_|",
        "   "
      ])

    assert number == {:ok, "0"}
  end

  @tag :pending
  test "Recognizes 1" do
    number =
      OcrNumbers.convert([
        "   ",
        "  |",
        "  |",
        "   "
      ])

    assert number == {:ok, "1"}
  end

  @tag :pending
  test "Unreadable but correctly sized inputs return ?" do
    number =
      OcrNumbers.convert([
        "   ",
        "  _",
        "  |",
        "   "
      ])

    assert number == {:ok, "?"}
  end

  @tag :pending
  test "Input with a number of lines that is not a multiple of four raises an error" do
    number =
      OcrNumbers.convert([
        " _ ",
        "| |",
        "   "
      ])

    assert number == {:error, 'invalid line count'}
  end

  @tag :pending
  test "Input with a number of columns that is not a multiple of three raises an error" do
    number =
      OcrNumbers.convert([
        "    ",
        "   |",
        "   |",
        "    "
      ])

    assert number == {:error, 'invalid column count'}
  end

  @tag :pending
  test "Recognizes 110101100" do
    number =
      OcrNumbers.convert([
        "       _     _        _  _ ",
        "  |  || |  || |  |  || || |",
        "  |  ||_|  ||_|  |  ||_||_|",
        "                           "
      ])

    assert number == {:ok, "110101100"}
  end

  @tag :pending
  test "Garbled numbers in a string are replaced with ?" do
    number =
      OcrNumbers.convert([
        "       _     _           _ ",
        "  |  || |  || |     || || |",
        "  |  | _|  ||_|  |  ||_||_|",
        "                           "
      ])

    assert number == {:ok, "11?10?1?0"}
  end

  @tag :pending
  test "Recognizes 2" do
    number =
      OcrNumbers.convert([
        " _ ",
        " _|",
        "|_ ",
        "   "
      ])

    assert number == {:ok, "2"}
  end

  @tag :pending
  test "Recognizes 3" do
    number =
      OcrNumbers.convert([
        " _ ",
        " _|",
        " _|",
        "   "
      ])

    assert number == {:ok, "3"}
  end

  @tag :pending
  test "Recognizes 4" do
    number =
      OcrNumbers.convert([
        "   ",
        "|_|",
        "  |",
        "   "
      ])

    assert number == {:ok, "4"}
  end

  @tag :pending
  test "Recognizes 5" do
    number =
      OcrNumbers.convert([
        " _ ",
        "|_ ",
        " _|",
        "   "
      ])

    assert number == {:ok, "5"}
  end

  @tag :pending
  test "Recognizes 6" do
    number =
      OcrNumbers.convert([
        " _ ",
        "|_ ",
        "|_|",
        "   "
      ])

    assert number == {:ok, "6"}
  end

  @tag :pending
  test "Regonizes 7" do
    number =
      OcrNumbers.convert([
        " _ ",
        "  |",
        "  |",
        "   "
      ])

    assert number == {:ok, "7"}
  end

  @tag :pending
  test "Recognizes 8" do
    number =
      OcrNumbers.convert([
        " _ ",
        "|_|",
        "|_|",
        "   "
      ])

    assert number == {:ok, "8"}
  end

  @tag :pending
  test "Recognizes 9" do
    number =
      OcrNumbers.convert([
        " _ ",
        "|_|",
        " _|",
        "   "
      ])

    assert number == {:ok, "9"}
  end

  @tag :pending
  test "Recognizes string of decimal numbers" do
    number =
      OcrNumbers.convert([
        "    _  _     _  _  _  _  _  _ ",
        "  | _| _||_||_ |_   ||_||_|| |",
        "  ||_  _|  | _||_|  ||_| _||_|",
        "                              "
      ])

    assert number == {:ok, "1234567890"}
  end

  @tag :pending
  test "Numbers separated by empty lines are recognized. Lines are joined by commas." do
    number =
      OcrNumbers.convert([
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
      ])

    assert number == {:ok, "123,456,789"}
  end
end
