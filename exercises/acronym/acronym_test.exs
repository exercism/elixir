if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("acronym.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule AcronymTest do
  use ExUnit.Case

  test "it produces acronyms from title case" do
    assert Acronym.abbreviate("Portable Networks Graphic") === "PNG"
  end

  @tag :pending
  test "it produces acronyms from lower case" do
    assert Acronym.abbreviate("Ruby on Rails") === "ROR"
  end

  @tag :pending
  test "it produces acronyms from inconsistent case" do
    assert Acronym.abbreviate("HyperText Markup Language") === "HTML"
  end

  @tag :pending
  test "it ignores punctuation" do
    assert Acronym.abbreviate("First in, First out") === "FIFO"
  end

  @tag :pending
  test "it produces acronyms ignoring punctuation and casing" do
    assert Acronym.abbreviate("Complementary Metal-Oxide semiconductor") === "CMOS"
  end
end
