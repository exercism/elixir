defmodule LuhnTest do
  use ExUnit.Case

  test "single digit strings can not be valid" do
    refute Luhn.valid?("1")
  end

  @tag :pending
  test "A single zero is invalid" do
    refute Luhn.valid?("0")
  end

  @tag :pending
  test "a simple valid SIN that remains valid if reversed" do
    assert Luhn.valid?("059")
  end

  @tag :pending
  test "a simple valid SIN that becomes invalid if reversed" do
    assert Luhn.valid?("59")
  end

  @tag :pending
  test "a valid Canadian SIN" do
    assert Luhn.valid?("055 444 285")
  end

  @tag :pending
  test "invalid Canadian SIN" do
    refute Luhn.valid?("055 444 286")
  end

  @tag :pending
  test "invalid credit card" do
    refute Luhn.valid?("8273 1232 7352 0569")
  end

  @tag :pending
  test "valid strings with a non-digit included become invalid" do
    refute Luhn.valid?("055a 444 285")
  end

  @tag :pending
  test "valid strings with punctuation included become invalid" do
    refute Luhn.valid?("055-444-285")
  end

  @tag :pending
  test "valid strings with symbols included become invalid" do
    refute Luhn.valid?("055£ 444$ 285")
  end

  @tag :pending
  test "single zero with space is invalid" do
    refute Luhn.valid?(" 0")
  end

  @tag :pending
  test "more than a single zero is valid" do
    assert Luhn.valid?("0000 0")
  end

  @tag :pending
  test "input digit 9 is correctly converted to output digit 9" do
    assert Luhn.valid?("091")
  end
end
