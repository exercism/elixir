defmodule RulesTest do
  use ExUnit.Case

  describe "eat_ghost?/2" do
    test "ghost gets eaten" do
      assert Rules.eat_ghost?(true, true)
    end

    test "ghost does not get eaten because no power pellet active" do
      refute Rules.eat_ghost?(false, true)
    end

    test "ghost does not get eaten because not touching ghost" do
      refute Rules.eat_ghost?(true, false)
    end
  end

  describe "score?/2" do
    test "score when eating dot" do
      assert Rules.score?(false, true)
    end

    test "score when eating power pellet" do
      assert Rules.score?(true, false)
    end

    test "no score when nothing eaten" do
      refute Rules.score?(false, false)
    end
  end

  describe "lose?/2" do
    test "lose if touching a ghost without a power pellet active" do
      assert Rules.lose?(false, true)
    end

    test "don't lose if touching a ghost with a power pellet active" do
      refute Rules.lose?(true, true)
    end

    test "don't lose if not touching a ghost" do
      refute Rules.lose?(true, false)
    end
  end

  describe "win?/3" do
    test "win if all dots eaten" do
      assert Rules.win?(true, false, false)
    end

    test "don't win if all dots eaten, but touching a ghost" do
      refute Rules.win?(true, false, true)
    end

    test "win if all dots eaten and touching a ghost with a power pellet active" do
      assert Rules.win?(true, true, true)
    end
  end
end
