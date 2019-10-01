defmodule DndCharacter do
  @type t :: %{
          strength: pos_integer,
          dexterity: pos_integer,
          constitution: pos_integer,
          intelligence: pos_integer,
          wisdom: pos_integer,
          charisma: pos_integer,
          hitpoints: pos_integer
        }

  @spec modifier(pos_integer) :: integer
  def modifier(score) do
  end

  def ability do
  end

  @spec character :: t()
  def character do
  end
end
