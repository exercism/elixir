if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("resistor_color.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ResistorColorTest do
  use ExUnit.Case

  @colors ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

  # @tag :pending
  test "returns black color code" do
    assert ResistorColor.code("black") == 0
  end

  @tag :pending
  test "returns white color code" do
    assert ResistorColor.code("white") == 9
  end

  @tag :pending
  test "returns orange color code" do
    assert ResistorColor.code("orange") == 3
  end

  @tag :pending
  test "returns violet color code" do
    assert ResistorColor.code("violet") == 7
  end

  @tag :pending
  test "returns all colors" do
    assert ResistorColor.colors() == @colors
  end
end
