defmodule ChangeTest do
  use ExUnit.Case

  # @tag :pending
  test "single coin change" do
    coins = [1, 5, 10, 25, 100]
    expected = [25]
    assert Change.generate(coins, 25) == {:ok, expected}
  end

  @tag :pending
  test "multiple coin change" do
    coins = [1, 5, 10, 25, 100]
    expected = [5, 10]
    assert Change.generate(coins, 15) == {:ok, expected}
  end

  @tag :pending
  test "change with Lilliputian Coins" do
    coins = [1, 4, 15, 20, 50]
    expected = [4, 4, 15]
    assert Change.generate(coins, 23) == {:ok, expected}
  end

  @tag :pending
  test "change with Lower Elbonia Coins" do
    coins = [1, 5, 10, 21, 25]
    expected = [21, 21, 21]
    assert Change.generate(coins, 63) == {:ok, expected}
  end

  @tag :pending
  test "large target values" do
    coins = [1, 2, 5, 10, 20, 50, 100]
    expected = [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100]
    assert Change.generate(coins, 999) == {:ok, expected}
  end

  @tag :pending
  test "possible change without unit coins available" do
    coins = [2, 5, 10, 20, 50]
    expected = [2, 2, 2, 5, 10]
    assert Change.generate(coins, 21) == {:ok, expected}
  end

  @tag :pending
  test "no coins make 0 change" do
    coins = [1, 5, 10, 21, 25]
    expected = []
    assert Change.generate(coins, 0) == {:ok, expected}
  end

  @tag :pending
  test "error testing for change smaller than the smallest of coins" do
    coins = [5, 10]
    assert Change.generate(coins, 3) == {:error, "cannot change"}
  end

  @tag :pending
  test "error if no combination can add up to target" do
    coins = [5, 10]
    assert Change.generate(coins, 94) == {:error, "cannot change"}
  end

  @tag :pending
  test "cannot find negative change values" do
    coins = [1, 2, 5]
    assert Change.generate(coins, -5) == {:error, "cannot change"}
  end
end
