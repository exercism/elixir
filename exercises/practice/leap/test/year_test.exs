defmodule YearTest do
  use ExUnit.Case

  @tag task_id: 1
  test "year not divisible by 4 is common year" do
    refute Year.leap_year?(2015)
  end

  @tag task_id: 2
  test "year divisible by 2, not divisible by 4 is common year" do
    refute Year.leap_year?(1970)
  end

  @tag task_id: 3
  test "year divisible by 4, not divisible by 100 is leap year" do
    assert Year.leap_year?(1996)
  end

  @tag task_id: 4
  test "year divisible by 4 and 5 is still a leap year" do
    assert Year.leap_year?(1960)
  end

  @tag task_id: 5
  test "year divisible by 100, not divisible by 400 is common year" do
    refute Year.leap_year?(2100)
  end

  @tag task_id: 6
  test "year divisible by 100 but not by 3 is still not a leap year" do
    refute Year.leap_year?(1900)
  end

  @tag task_id: 7
  test "year divisible by 400 is leap year" do
    assert Year.leap_year?(2000)
  end

  @tag task_id: 8
  test "year divisible by 400 but not by 125 is still a leap year" do
    assert Year.leap_year?(2400)
  end

  @tag task_id: 9
  test "year divisible by 200, not divisible by 400 in common year" do
    refute Year.leap_year?(1800)
  end
end
