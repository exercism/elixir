defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_loaf_of_bread, %Character{} = character) do
      updated_character = %{character | health: character.health + 5}
      {nil, updated_character}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(mana_potion, %Character{} = character) do
      updated_character = %{character | mana: character.mana + mana_potion.strength}
      {%EmptyBottle{}, updated_character}
    end
  end

  defimpl Edible, for: Poison do
    def eat(poison, %Character{} = character) do
      updated_character = %{character | health: 0}
      {%EmptyBottle{}, updated_character}
    end
  end
end
