defmodule StringSeriesTest do
  use ExUnit.Case

  # @tag :pending
  test "slices of size 1 from one" do
    assert StringSeries.slices("1", 1) == ["1"]
  end

  @tag :pending
  test "slices of size 1 from two" do
    assert StringSeries.slices("12", 1) == ["1", "2"]
  end

  @tag :pending
  test "slices of size 1 from more" do
    assert StringSeries.slices("01234", 1) == ["0", "1", "2", "3", "4"]
  end

  @tag :pending
  test "slices of size 2" do
    assert StringSeries.slices("35", 2) == ["35"]
  end

  @tag :pending
  test "slices of size 2 overlap" do
    assert StringSeries.slices("9142", 2) == ["91", "14", "42"]
  end

  @tag :pending
  test "slices of size 2 from more" do
    assert StringSeries.slices("01234", 2) == ["01", "12", "23", "34"]
  end

  @tag :pending
  test "slices of size 3" do
    assert StringSeries.slices("01234", 3) == ["012", "123", "234"]
  end

  @tag :pending
  test "slices of size 4" do
    assert StringSeries.slices("01234", 4) == ["0123", "1234"]
  end

  @tag :pending
  test "slices include duplicates" do
    assert StringSeries.slices("777777", 3) == ["777", "777", "777", "777"]
  end

  @tag :pending
  test "slices of a long series" do
    assert StringSeries.slices("918493904243", 5) == [
             "91849",
             "18493",
             "84939",
             "49390",
             "93904",
             "39042",
             "90424",
             "04243"
           ]
  end

  @tag :pending
  test "slices same size as string" do
    assert StringSeries.slices("01234", 5) == ["01234"]
  end

  @tag :pending
  test "Unicode characters count as a single character" do
    assert StringSeries.slices("José", 1) == ["J", "o", "s", "é"]
    assert StringSeries.slices("José", 2) == ["Jo", "os", "sé"]
  end

  @tag :pending
  test "slices with size longer than string return empty list" do
    assert StringSeries.slices("01234", 6) == []
  end

  @tag :pending
  test "slices with size zero or negative return empty list" do
    assert StringSeries.slices("01234", -1) == []
    assert StringSeries.slices("01234", 0) == []
  end
end
