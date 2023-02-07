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

  @tag :pending
  test "Blue and violet and blue" do
    colors = [:blue, :violet, :blue]
    output = ResistorColorTrio.label(colors)
    expected = {67, :megaohms}

    assert output == expected
  end

  @tag :pending
  test "Minimum possible value" do
    colors = [:black, :black, :black]
    output = ResistorColorTrio.label(colors)
    expected = {0, :ohms}

    assert output == expected
  end

  @tag :pending
  test "Maximum possible value" do
    colors = [:white, :white, :white]
    output = ResistorColorTrio.label(colors)
    expected = {99, :gigaohms}

    assert output == expected
  end

  @tag :pending
  test "First two colors make an invalid octal number" do
    colors = [:black, :grey, :black]
    output = ResistorColorTrio.label(colors)
    expected = {8, :ohms}

    assert output == expected
  end

  @tag :pending
  test "Ignore extra colors" do
    colors = [:blue, :green, :yellow, :orange]
    output = ResistorColorTrio.label(colors)
    expected = {650, :kiloohms}

    assert output == expected
  end
end
