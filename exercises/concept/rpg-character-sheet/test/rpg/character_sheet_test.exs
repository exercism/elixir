defmodule RPG.CharacterSheetTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "welcome/0" do
    @tag task_id: 1
    test "it prints a welcome message" do
      io =
        capture_io(fn ->
          assert RPG.CharacterSheet.welcome() == :ok
        end)

      assert io == "Welcome! Let's fill out your character sheet together.\n"
    end
  end

  describe "ask_name/0" do
    @tag task_id: 2
    test "it prints a prompt" do
      io =
        capture_io("\n", fn ->
          RPG.CharacterSheet.ask_name()
        end)

      assert io == "What is your character's name?\n"
    end

    @tag task_id: 2
    test "returns the trimmed input" do
      capture_io("Maxwell The Great\n", fn ->
        assert RPG.CharacterSheet.ask_name() == "Maxwell The Great"
      end)
    end
  end

  describe "ask_class/0" do
    @tag task_id: 3
    test "it prints a prompt" do
      io =
        capture_io("\n", fn ->
          RPG.CharacterSheet.ask_class()
        end)

      assert io == "What is your character's class?\n"
    end

    @tag task_id: 3
    test "returns the trimmed input" do
      capture_io("rogue\n", fn ->
        assert RPG.CharacterSheet.ask_class() == "rogue"
      end)
    end
  end

  describe "ask_level/0" do
    @tag task_id: 4
    test "it prints a prompt" do
      io =
        capture_io("1\n", fn ->
          RPG.CharacterSheet.ask_level()
        end)

      assert io == "What is your character's level?\n"
    end

    @tag task_id: 4
    test "returns the trimmed input as an integer" do
      capture_io("3\n", fn ->
        assert RPG.CharacterSheet.ask_level() == 3
      end)
    end
  end

  describe "run/0" do
    @tag task_id: 5
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

    @tag task_id: 5
    test "it returns a character map" do
      capture_io("The Stranger\nrogue\n2\n", fn ->
        assert RPG.CharacterSheet.run() == %{
                 name: "The Stranger",
                 class: "rogue",
                 level: 2
               }
      end)
    end

    @tag task_id: 5
    test "it only has a single colon and single space after the 'Your character' label" do
      io =
        capture_io("Anne\nhealer\n4\n", fn ->
          RPG.CharacterSheet.run()
        end)

      case Regex.run(~r/.*(Your character.*)%{/, io) do
        [_, label] ->
          assert label == "Your character: "

        _ ->
          nil
      end
    end

    @tag task_id: 5
    test "it inspects the character map" do
      io =
        capture_io("Anne\nhealer\n4\n", fn ->
          RPG.CharacterSheet.run()
        end)

      assert io =~
               "\nYour character: " <>
                 inspect(%{
                   name: "Anne",
                   class: "healer",
                   level: 4
                 })
    end
  end
end
