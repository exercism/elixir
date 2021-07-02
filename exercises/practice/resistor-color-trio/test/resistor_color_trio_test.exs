defmodule ResistorColorTrioTest do
  use ExUnit.Case

  # @tag :pending
  test "Orange and orange and black" do
    colors = [:orange, :orange, :black]
    output = ResistorColorTrio.label(colors)
    expected = {33, :ohms}

    assert output == expected
  end

  @tag :pending
  test "Blue and grey and brown" do
    colors = [:blue, :grey, :brown]
    output = ResistorColorTrio.label(colors)
    expected = {680, :ohms}

    assert output == expected
  end

  @tag :pending
  test "Red and black and red" do
    colors = [:red, :black, :red]
    output = ResistorColorTrio.label(colors)
    expected = {2, :kiloohms}

    assert output == expected
  end

  @tag :pending
  test "Green and brown and orange" do
    colors = [:green, :brown, :orange]
    output = ResistorColorTrio.label(colors)
    expected = {51, :kiloohms}

    assert output == expected
  end

  @tag :pending
  test "Yellow and violet and yellow" do
    colors = [:yellow, :violet, :yellow]
    output = ResistorColorTrio.label(colors)
    expected = {470, :kiloohms}

    assert output == expected
  end
end
