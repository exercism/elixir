defmodule LanguageListTest do
  use ExUnit.Case

  describe "new/0" do
    @tag task_id: 1
    test "new list" do
      assert LanguageList.new() == []
    end
  end

  describe "add/2" do
    @tag task_id: 2
    test "add a language to a list" do
      language = "Elixir"
      list = [language]

      assert LanguageList.new() |> LanguageList.add(language) == list
    end

    @tag task_id: 2
    test "add several languages to a list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Clojure")
        |> LanguageList.add("Haskell")
        |> LanguageList.add("Erlang")
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")

      assert list == ["Elixir", "F#", "Erlang", "Haskell", "Clojure"]
    end
  end

  describe "remove/1" do
    @tag task_id: 3
    test "add then remove results in empty list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == []
    end

    @tag task_id: 3
    test "adding two languages, when removed, removes first item" do
      list =
        LanguageList.new()
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == ["F#"]
    end
  end

  describe "first/1" do
    @tag task_id: 4
    test "add one language, then get the first" do
      assert LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.first() == "Elixir"
    end

    @tag task_id: 4
    test "add a few languages, then get the first" do
      first =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.first()

      assert first == "F#"
    end
  end

  describe "count/1" do
    @tag task_id: 5
    test "the count of a new list is 0" do
      assert LanguageList.new() |> LanguageList.count() == 0
    end

    @tag task_id: 5
    test "the count of a one-language list is 1" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.count()

      assert count == 1
    end

    @tag task_id: 5
    test "the count of a multiple-item list is equal to its length" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.count()

      assert count == 3
    end
  end

  describe "functional_list?/1" do
    @tag task_id: 6
    test "a functional language list" do
      assert LanguageList.functional_list?(["Clojure", "Haskell", "Erlang", "Elixir", "F#"])
    end

    @tag task_id: 6
    test "not a functional language list" do
      refute LanguageList.functional_list?(["Java", "C", "JavaScript"])
    end
  end
end
