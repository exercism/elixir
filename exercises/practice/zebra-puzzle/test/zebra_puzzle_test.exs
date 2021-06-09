defmodule ZebraPuzzleTest do
  import ZebraPuzzle
  use ExUnit.Case

  # @tag :pending
  test "resident who drinks water" do
    assert drinks_water() == :norwegian  
  end

  @tag :pending
  test "resident who owns zebra" do
    assert owns_zebra == :japanese 
  end
end
