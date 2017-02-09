if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("series.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule StringSeriesTest do
  use ExUnit.Case

  test "slices of 1" do
    assert StringSeries.slices("01234", 1) == ["0", "1", "2", "3", "4"]
    assert StringSeries.slices("92834", 1) == ["9", "2", "8", "3", "4"]
  end

  @tag :pending
  test "slices of 2" do
    assert StringSeries.slices("01234", 2) == ["01", "12", "23", "34"]
    assert StringSeries.slices("98273463", 2) == ["98", "82", "27", "73", "34", "46", "63"]
    assert StringSeries.slices("37103", 2) == ["37", "71", "10", "03"]
  end

  @tag :pending
  test "slices of 3" do
    assert StringSeries.slices("01234", 3) == ["012", "123", "234"]
    assert StringSeries.slices("31001", 3) == ["310", "100", "001"]
    assert StringSeries.slices("982347", 3) == ["982", "823", "234", "347"]
  end

  @tag :pending
  test "slices of 4" do
    assert StringSeries.slices("01234", 4) == ["0123", "1234"]
    assert StringSeries.slices("91274", 4) == ["9127", "1274"]
  end

  @tag :pending
  test "slices same size as string" do
    assert StringSeries.slices("01234", 5) == ["01234"]
    assert StringSeries.slices("31001", 5) == ["31001"]
    assert StringSeries.slices("982347", 6) == ["982347"]
  end

  @tag :pending
  test "slices bigger than string" do
    assert StringSeries.slices("01234", 6) == []
    assert StringSeries.slices("31001", 6) == []
    assert StringSeries.slices("982347", 7) == []
  end

  @tag :pending
  test "negative-sized slices" do
    assert StringSeries.slices("01234", -2) == []
    assert StringSeries.slices("31001", -1) == []
    assert StringSeries.slices("982347", 0) == []
  end
end

