defmodule StringSeriesTest do
  use ExUnit.Case

  # @tag :pending
  test "slices of size 1" do
    assert StringSeries.slices("01234", 1) == ["0", "1", "2", "3", "4"]
  end

  @tag :pending
  test "slices of size 2" do
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
