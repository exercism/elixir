defmodule PopCountTest do
  use ExUnit.Case

  describe "egg count" do
    test "0 eggs" do
      assert PopCount.eggCount(0) == 0
    end

    @tag :pending
    test "1 egg" do
      assert PopCount.eggCount(16) == 1
    end

    @tag :pending
    test "4 eggs" do
      assert PopCount.eggCount(89) == 4
    end

    @tag :pending
    test "13 eggs" do
      assert PopCount.eggCount(2_000_000_000) == 13
    end
  end
end
