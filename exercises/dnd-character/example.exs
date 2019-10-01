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

  def __struct__() do
    constitution = ability()

    %{
      __struct__: __MODULE__,
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: 10 + modifier(constitution)
    }
  end

  def __struct__(kv) do
    Enum.reduce(kv, __struct__(), fn {k, v}, acc -> :maps.update(k, v, acc) end)
  end

  @spec modifier(pos_integer) :: integer
  def modifier(score), do: :erlang.floor((score - 10) / 2)

  @spec ability :: pos_integer
  def ability(), do: :rand.uniform(16) + 2

  @spec character :: t()
  def character() do
    %__MODULE__{}
  end
end
