if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("leap.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule LeapTest do
  use ExUnit.Case

  # @tag :pending
  test "vanilla leap year" do
    assert Year.leap_year?(1996)
  end

  @tag :pending
  test "any old year" do
    refute Year.leap_year?(1997), "1997 is not a leap year."
  end

  @tag :pending
  test "century" do
    refute Year.leap_year?(1900), "1900 is not a leap year."
  end

  @tag :pending
  test "exceptional century" do
    assert Year.leap_year?(2400)
  end
end
