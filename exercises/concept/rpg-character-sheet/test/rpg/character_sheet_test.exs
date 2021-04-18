defmodule RPG.CharacterSheetTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "welcome/0" do
    test "it prints a welcome message" do
      io =
        capture_io(fn ->
          assert RPG.CharacterSheet.welcome() == :ok
        end)

      assert io == "Welcome! Let's fill out your character sheet together.\n"
    end
  end

  describe "ask_name/0" do
    test "it prints a prompt" do
      io =
        capture_io("\n", fn ->
          RPG.CharacterSheet.ask_name()
        end)

      assert io == "What is your character's name?\n"
    end

    test "returns the trimmed input" do
      capture_io("Maxwell The Great\n", fn ->
        assert RPG.CharacterSheet.ask_name() == "Maxwell The Great"
      end)
    end
  end

  describe "ask_class/0" do
    test "it prints a prompt" do
      io =
        capture_io("\n", fn ->
          RPG.CharacterSheet.ask_class()
        end)

      assert io == "What is your character's class?\n"
    end

    test "returns the trimmed input" do
      capture_io("rogue\n", fn ->
        assert RPG.CharacterSheet.ask_class() == "rogue"
      end)
    end
  end

  describe "ask_level/0" do
    test "it prints a prompt" do
      io =
        capture_io("1\n", fn ->
          RPG.CharacterSheet.ask_level()
        end)

      assert io == "What is your character's level?\n"
    end

    test "returns the trimmed input as an integer" do
      capture_io("3\n", fn ->
        assert RPG.CharacterSheet.ask_level() == 3
      end)
    end
  end

  describe "run/0" do
    test "it asks for name, class, and level" do
      io =
        capture_io("Susan The Fearless\nfighter\n6\n", fn ->
          RPG.CharacterSheet.run()
        end)

      assert io =~ """
             Welcome! Let's fill out your character sheet together.
             What is your character's name?
             What is your character's class?
             What is your character's level?
             """
    end

    test "it returns a character map" do
      capture_io("The Stranger\nrogue\n2\n", fn ->
        assert RPG.CharacterSheet.run() == %{
                 name: "The Stranger",
                 class: "rogue",
                 level: 2
               }
      end)
    end

    test "it inspects the character map" do
      io =
        capture_io("Anne\nhealer\n4\n", fn ->
          RPG.CharacterSheet.run()
        end)

      assert io =~
               inspect(
                 %{
                   name: "Anne",
                   class: "healer",
                   level: 4
                 },
                 label: "Your character"
               )
    end
  end
end
