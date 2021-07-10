defmodule YearTest do
  use ExUnit.Case

  # @tag :pending
  test "year not divisible by 4 is common year" do
    refute Year.leap_year?(2015)
  end

  @tag :pending
  test "year divisible by 2, not divisible by 4 is common year" do
    refute Year.leap_year?(1970)
  end

  @tag :pending
  test "year divisible by 4, not divisible by 100 is leap year" do
    assert Year.leap_year?(1996)
  end

  @tag :pending
  test "year divisible by 4 and 5 is still a leap year" do
    assert Year.leap_year?(1960)
  end

  @tag :pending
  test "year divisible by 100, not divisible by 400 is common year" do
    refute Year.leap_year?(2100)
  end

  @tag :pending
  test "year divisible by 100 but not by 3 is still not a leap year" do
    refute Year.leap_year?(1900)
  end

  @tag :pending
  test "year divisible by 400 is leap year" do
    assert Year.leap_year?(2000)
  end

  @tag :pending
  test "year divisible by 400 but not by 125 is still a leap year" do
    assert Year.leap_year?(2400)
  end

  @tag :pending
  test "year divisible by 200, not divisible by 400 in common year" do
    refute Year.leap_year?(1800)
  end
end
