defmodule EliudsEggsTest do
  use ExUnit.Case

  describe "egg count" do
    test "0 eggs" do
      assert EliudsEggs.egg_count(0) == 0
    end

    @tag :pending
    test "1 egg" do
      assert EliudsEggs.egg_count(16) == 1
    end

    @tag :pending
    test "4 eggs" do
      assert EliudsEggs.egg_count(89) == 4
    end

    @tag :pending
    test "13 eggs" do
      assert EliudsEggs.egg_count(2_000_000_000) == 13
    end

    @tag :pending
    test "100 eggs" do
      assert EliudsEggs.egg_count(1_267_650_600_228_229_401_496_703_205_375) == 100
    end
  end
end
