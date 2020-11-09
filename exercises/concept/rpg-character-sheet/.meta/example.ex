defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    name = IO.gets("What is your character's name?\n")
    String.trim(name)
  end

  def ask_class() do
    name = IO.gets("What is your character's class?\n")
    String.trim(name)
  end

  def ask_level() do
    level = IO.gets("What is your character's level?\n")
    level = String.trim(level)
    String.to_integer(level)
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    character = %{
      name: name,
      class: class,
      level: level
    }

    IO.inspect(character, label: "Your character")
  end
end
