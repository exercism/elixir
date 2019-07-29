defmodule GrainsTest do
  use ExUnit.Case

  # @tag :pending
  test "square 1" do
    assert Grains.square(1) === {:ok, 1}
  end

  @tag :pending
  test "square 2" do
    assert Grains.square(2) === {:ok, 2}
  end

  @tag :pending
  test "square 3" do
    assert Grains.square(3) === {:ok, 4}
  end

  @tag :pending
  test "square 4" do
    assert Grains.square(4) === {:ok, 8}
  end

  @tag :pending
  test "square 16" do
    assert Grains.square(16) === {:ok, 32768}
  end

  @tag :pending
  test "square 32" do
    assert Grains.square(32) === {:ok, 2_147_483_648}
  end

  @tag :pending
  test "square 64" do
    assert Grains.square(64) === {:ok, 9_223_372_036_854_775_808}
  end

  @tag :pending
  test "total grains" do
    assert Grains.total() === {:ok, 18_446_744_073_709_551_615}
  end

  @tag :pending
  test "square greater than 64 returns an error" do
    assert Grains.square(65) ===
             {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  @tag :pending
  test "negative square returns an error" do
    assert Grains.square(-1) ===
             {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  @tag :pending
  test "square 0 returns an error" do
    assert Grains.square(0) ===
             {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end
end
