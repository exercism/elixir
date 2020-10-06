defmodule RPGTest do
  use ExUnit.Case

  alias RPG.{Edible, Character, LoafOfBread, ManaPotion, Poison, EmptyBottle}

  defmodule NewItem do
    defstruct []
  end

  describe "Edible" do
    test "is a protocol" do
      assert Edible.__protocol__(:functions) == [eat: 2]
    end

    test "cannot eat a completely new item" do
      assert_raise Protocol.UndefinedError, fn ->
        Edible.eat(%NewItem{}, %Character{})
      end
    end
  end

  describe "LoafOfBread" do
    test "implements the Edible protocol" do
      {:consolidated, modules} = Edible.__protocol__(:impls)
      assert LoafOfBread in modules
    end

    test "eating it increases health" do
      character = %Character{health: 50}
      {byproduct, %Character{} = character} = Edible.eat(%LoafOfBread{}, character)
      assert character.health == 55
    end

    test "eating it has no byproduct" do
      character = %Character{}
      {byproduct, %Character{}} = Edible.eat(%LoafOfBread{}, character)
      assert byproduct == nil
    end
  end

  describe "ManaPotion" do
    test "implements the Edible protocol" do
      {:consolidated, modules} = Edible.__protocol__(:impls)
      assert ManaPotion in modules
    end

    test "eating it increases mana" do
      character = %Character{mana: 10}
      {byproduct, %Character{} = character} = Edible.eat(%ManaPotion{strength: 6}, character)
      assert character.mana == 16
    end

    test "eating it produces an empty bottle" do
      character = %Character{}
      {byproduct, %Character{}} = Edible.eat(%ManaPotion{}, character)
      assert byproduct == %EmptyBottle{}
    end
  end

  describe "Poison" do
    test "implements the Edible protocol" do
      {:consolidated, modules} = Edible.__protocol__(:impls)
      assert Poison in modules
    end

    test "eating it brings health down to 0" do
      character = %Character{health: 120}
      {byproduct, %Character{} = character} = Edible.eat(%Poison{}, character)
      assert character.health == 0
    end

    test "eating it produces an empty bottle" do
      character = %Character{}
      {byproduct, %Character{}} = Edible.eat(%Poison{}, character)
      assert byproduct == %EmptyBottle{}
    end
  end

  test "eating many things one after another" do
    items = [
      %LoafOfBread{},
      %ManaPotion{strength: 10},
      %ManaPotion{strength: 2},
      %LoafOfBread{}
    ]

    character = %Character{health: 100, mana: 100}

    character =
      Enum.reduce(items, character, fn item, character ->
        {_, character} = Edible.eat(item, character)
        character
      end)

    assert character.health == 110
    assert character.mana == 112
  end
end
