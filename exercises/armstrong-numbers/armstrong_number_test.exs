if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("armstrong_number.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ArmstrongNumberTest do
  use ExUnit.Case

  test "One-digit numbers are Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(1)
    assert ArmstrongNumber.is_valid?(6)
    assert ArmstrongNumber.is_valid?(9)
  end

  @tag :pending
  test "Two-digit numbers aren't Armstrong numbers" do
    refute ArmstrongNumber.is_valid?(11)
    refute ArmstrongNumber.is_valid?(89)
    refute ArmstrongNumber.is_valid?(44)
  end

  @tag :pending
  test "Three-digit numbers that are the Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(153)
    assert ArmstrongNumber.is_valid?(370)
  end

  @tag :pending
  test "Three-digit numbers that aren't the Armstrong numbers" do
    refute ArmstrongNumber.is_valid?(555)
    refute ArmstrongNumber.is_valid?(662)
  end

  @tag :pending
  test "Four-digit number that is the Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(1634)
  end

  @tag :pending
  test "Four-digit number that is not the Armstrong numbers" do
    refute ArmstrongNumber.is_valid?(9989)
  end

  @tag :pending
  test "Seven-digit number that is the Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(9_926_315)
  end

  @tag :pending
  test "Seven-digit number that is not the Armstrong numbers" do
    refute ArmstrongNumber.is_valid?(2_369_989)
  end

  @tag :pending
  test "Ten-digit number that is the Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(4_679_307_774)
  end

  @tag :pending
  test "Fourteen-digit number that is the Armstrong numbers" do
    assert ArmstrongNumber.is_valid?(28_116_440_335_967)
  end
end
