if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("say.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule SayTest do
  use ExUnit.Case

  # @tag :pending
  test "zero" do
    assert Say.in_english(0) == {:ok, "zero"}
  end

  @tag :pending
  test "one" do
    assert Say.in_english(1) == {:ok, "one"}
  end

  @tag :pending
  test "fourteen" do
    assert Say.in_english(14) == {:ok, "fourteen"}
  end

  @tag :pending
  test "twenty" do
    assert Say.in_english(20) == {:ok, "twenty"}
  end

  @tag :pending
  test "twenty-two" do
    assert Say.in_english(22) == {:ok, "twenty-two"}
  end

  @tag :pending
  test "one hundred" do
    assert Say.in_english(100) == {:ok, "one hundred"}
  end

  @tag :pending
  test "one hundred twenty-three" do
    assert Say.in_english(123) == {:ok, "one hundred twenty-three"}
  end

  @tag :pending
  test "one thousand" do
    assert Say.in_english(1_000) == {:ok, "one thousand"}
  end

  @tag :pending
  test "one thousand two hundred thirty-four" do
    assert Say.in_english(1_234) == {:ok, "one thousand two hundred thirty-four"}
  end

  @tag :pending
  test "one million" do
    assert Say.in_english(1_000_000) == {:ok, "one million"}
  end

  @tag :pending
  test "one million two thousand three hundred forty-five" do
    assert Say.in_english(1_002_345) == {:ok, "one million two thousand three hundred forty-five"}
  end

  @tag :pending
  test "one billion" do
    assert Say.in_english(1_000_000_000) == {:ok, "one billion"}
  end

  @tag :pending
  test "a big number" do
    assert Say.in_english(987_654_321_123) ==
             {:ok,
              "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"}
  end

  @tag :pending
  test "numbers below zero are out of range" do
    assert Say.in_english(-1) == {:error, "number is out of range"}
  end

  @tag :pending
  test "numbers above 999,999,999,999 are out of range" do
    assert Say.in_english(1_000_000_000_000) == {:error, "number is out of range"}
  end
end
