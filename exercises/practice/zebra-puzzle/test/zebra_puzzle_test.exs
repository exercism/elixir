defmodule ZebraPuzzleTest do
  use ExUnit.Case

  # @tag :pending
  test "resident who drinks water" do
    assert ZebraPuzzle.drinks_water() == :norwegian
  end

  @tag :pending
  test "resident who owns zebra" do
    assert ZebraPuzzle.owns_zebra() == :japanese
  end
end
