if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("isogram.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule IsogramTest do
  use ExUnit.Case

  test "isogram in lowercase" do
    refute Isogram.isogram?("eleven")
  end

  @tag :pending
  test "not isogram in lowercase" do
    assert Isogram.isogram?("subdermatoglyphic")
  end

  @tag :pending
  test "not isogram in upper and lower case" do
    refute Isogram.isogram?("Alphabet")
  end

  @tag :pending
  test "isogram with dash" do
    assert Isogram.isogram?("thumbscrew-japingly")
  end

  @tag :pending
  test "isogram with dash in upper and lower case" do
    assert Isogram.isogram?("Hjelmqvist-Gryb-Zock-Pfund-Wax")
  end

  @tag :pending
  test "isogram with utf-8 letters in upper and lower case" do
    assert Isogram.isogram?("Heizölrückstoßabdämpfung")
  end

  @tag :pending
  test "phrase is not isogram" do
    refute Isogram.isogram?("the quick brown fox")
  end

  @tag :pending
  test "isogram is phrase in upper and lower case" do
    assert Isogram.isogram?("Emily Jung Schwartzkopf")
  end

  @tag :pending
  test "not isogram with utf-8 letter" do
    refute Isogram.isogram?("éléphant")
  end
end
