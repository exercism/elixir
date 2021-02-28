defmodule DndCharacterTest do
  use ExUnit.Case

  import DndCharacter, only: [modifier: 1, ability: 0, character: 0]

  describe "ability modifier" do
    # @tag :pending
    test "for score 3 is -4" do
      assert modifier(3) === -4
    end

    @tag :pending
    test "for score 4 is -3" do
      assert modifier(4) === -3
    end

    @tag :pending
    test "for score 5 is -3" do
      assert modifier(5) === -3
    end

    @tag :pending
    test "for score 6 is -2" do
      assert modifier(6) === -2
    end

    @tag :pending
    test "for score 7 is -2" do
      assert modifier(7) === -2
    end

    @tag :pending
    test "for score 8 is -1" do
      assert modifier(8) === -1
    end

    @tag :pending
    test "for score 9 is -1" do
      assert modifier(9) === -1
    end

    @tag :pending
    test "for score 10 is 0" do
      assert modifier(10) === 0
    end

    @tag :pending
    test "for score 11 is 0" do
      assert modifier(11) === 0
    end

    @tag :pending
    test "for score 12 is +1" do
      assert modifier(12) === 1
    end

    @tag :pending
    test "for score 13 is +1" do
      assert modifier(13) === 1
    end

    @tag :pending
    test "for score 14 is +2" do
      assert modifier(14) === 2
    end

    @tag :pending
    test "for score 15 is +2" do
      assert modifier(15) === 2
    end

    @tag :pending
    test "for score 16 is +3" do
      assert modifier(16) === 3
    end

    @tag :pending
    test "for score 17 is +3" do
      assert modifier(17) === 3
    end

    @tag :pending
    test "for score 18 is +4" do
      assert modifier(18) === 4
    end
  end

  describe "random ability" do
    @tag :pending
    test "is within range" do
      Enum.each(1..200, fn _ -> assert ability() in 3..18 end)
    end
  end

  describe "random character" do
    @tag :pending
    test "has each ability within range and valid hitpoints" do
      Enum.each(1..20, fn _ ->
        character = character()

        assert character.strength in 3..18
        assert character.dexterity in 3..18
        assert character.constitution in 3..18
        assert character.intelligence in 3..18
        assert character.wisdom in 3..18
        assert character.charisma in 3..18
        assert character.hitpoints === 10 + modifier(character.constitution)
      end)
    end
  end
end
