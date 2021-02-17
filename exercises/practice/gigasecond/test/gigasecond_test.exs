defmodule GigasecondTest do
  use ExUnit.Case

  # @tag :pending
  test "from 2011-04-25 00:00:00" do
    assert Gigasecond.from({{2011, 4, 25}, {0, 0, 0}}) == {{2043, 1, 1}, {1, 46, 40}}
  end

  @tag :pending
  test "from 1977-06-13 00:00:00" do
    assert Gigasecond.from({{1977, 6, 13}, {0, 0, 0}}) == {{2009, 2, 19}, {1, 46, 40}}
  end

  @tag :pending
  test "from 1959-19-07 00:00:00" do
    assert Gigasecond.from({{1959, 7, 19}, {0, 0, 0}}) == {{1991, 3, 27}, {1, 46, 40}}
  end

  @tag :pending
  test "from 2015-01-24 22:00:00" do
    assert Gigasecond.from({{2015, 1, 24}, {22, 0, 0}}) == {{2046, 10, 2}, {23, 46, 40}}
  end

  @tag :pending
  test "from 2015-01-24 23:59:59" do
    assert Gigasecond.from({{2015, 1, 24}, {23, 59, 59}}) == {{2046, 10, 3}, {1, 46, 39}}
  end

  @tag :pending
  test "yourself" do
    # customize these values for yourself
    # your_birthday = {{year1, month1, day1}, {0, 0, 0}}
    # assert Gigasecond.from(your_birthday) == {{year2, month2, day2}, {hours, minutes, seconds}}
  end
end
