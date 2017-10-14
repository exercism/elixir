if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("luhn.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule LuhnTest do
  use ExUnit.Case

  test "single digit strings can not be valid" do
    assert Luhn.valid?("1") == false
  end

  @tag :pending
  test "A single zero is invalid" do
    assert Luhn.valid?("0") == false
  end

  @tag :pending
  test "a simple valid SIN that remains valid if reversed" do
    assert Luhn.valid?("059") == true
  end

  @tag :pending
  test "a simple valid SIN that becomes invalid if reversed" do
    assert Luhn.valid?("59") == true
  end

  @tag :pending
  test "a valid Canadian SIN" do
    assert Luhn.valid?("055 444 285") == true
  end

  @tag :pending
  test "invalid Canadian SIN" do
    assert Luhn.valid?("055 444 286") == false
  end

  @tag :pending
  test "invalid credit card" do
    assert Luhn.valid?("8273 1232 7352 0569") == false
  end

  @tag :pending
  test "valid strings with a non-digit included become invalid" do
    assert Luhn.valid?("055a 444 285") == false
  end

  @tag :pending
  test "valid strings with punctuation included become invalid" do
    assert Luhn.valid?("055-444-285") == false
  end

  @tag :pending
  test "valid strings with symbols included become invalid" do
    assert Luhn.valid?("055£ 444$ 285") == false
  end

  @tag :pending
  test "single zero with space is invalid" do
    assert Luhn.valid?(" 0") == false
  end

  @tag :pending
  test "more than a single zero is valid" do
    assert Luhn.valid?("0000 0") == true
  end

  @tag :pending
  test "input digit 9 is correctly converted to output digit 9" do
    assert Luhn.valid?("091") == true
  end
end
