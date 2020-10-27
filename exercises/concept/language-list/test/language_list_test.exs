defmodule LanguageListTest do
  use ExUnit.Case

  alias LanguageList, as: LL

  @languages ~w/Clojure Haskell Erlang F# Elixir/
  @languages_reversed Enum.reverse(@languages)

  # @tag :pending
  test "new list" do
    assert LL.new() == []
  end

  @tag :pending
  test "count an empty list" do
    assert LL.new() |> LL.count() == 0
  end

  @tag :pending
  test "add a language to a list" do
    language = "Elixir"
    list = [language]

    assert LL.new() |> LL.add(language) == list
  end

  @tag :pending
  test "add several languages to a list" do
    assert Enum.reduce(@languages, LL.new(), &LL.add(&2, &1)) == @languages_reversed
  end

  @tag :pending
  test "remove on an empty list results in error" do
    assert_raise ArgumentError, fn -> LL.new() |> LL.remove() end
  end

  @tag :pending
  test "add then remove results in empty list" do
    list =
      LL.new()
      |> LL.add("Elixir")
      |> LL.remove()

    assert list == []
  end

  @tag :pending
  test "adding two languages, when removed, removes first item" do
    list =
      LL.new()
      |> LL.add("F#")
      |> LL.add("Elixir")
      |> LL.remove()

    assert list = ~w/F#/
  end

  @tag :pending
  test "first on an empty list raises an error" do
    assert_raise ArgumentError, fn -> LL.new() |> LL.first() end
  end

  @tag :pending
  test "add one language, then get the first" do
    assert LL.new() |> LL.add("Elixir") |> LL.first() == "Elixir"
  end

  @tag :pending
  test "add a few languages, then get the first" do
    first =
      LL.new()
      |> LL.add("Elixir")
      |> LL.add("Prolog")
      |> LL.add("F#")
      |> LL.first()

    assert first == "F#"
  end

  @tag :pending
  test "the count of a new list is 0" do
    assert LL.new() |> LL.count() == 0
  end

  @tag :pending
  test "the count of a one-language list is 1" do
    count =
      LL.new()
      |> LL.add("Elixir")
      |> LL.count()

    assert count == 1
  end

  @tag :pending
  test "the count of a multiple-item list is equal to its length" do
    count =
      @languages
      |> Enum.reduce(LL.new(), &LL.add(&2, &1))
      |> LL.count()

    assert count == length(@languages)
  end

  @tag :pending
  test "an exciting language list" do
    assert LL.exciting_list?(@languages)
  end

  @tag :pending
  test "not an exciting language list" do
    refute LL.exciting_list?(~w/Java C JavaScript/)
  end
end
