defmodule ResistorColorDuoTest do
  use ExUnit.Case

  # @tag :pending
  test "Brown and black" do
    colors = [:brown, :black]
    output = ResistorColorDuo.value(colors)
    expected = 10

    assert output == expected
  end

  # @tag :pending
  test "Blue and grey" do
    colors = [:blue, :grey]
    output = ResistorColorDuo.value(colors)
    expected = 68

    assert output == expected
  end

  # @tag :pending
  test "Yellow and violet" do
    colors = [:yellow, :violet]
    output = ResistorColorDuo.value(colors)
    expected = 47

    assert output == expected
  end

  # @tag :pending
  test "White and red" do
    colors = [:white, :red]
    output = ResistorColorDuo.value(colors)
    expected = 92

    assert output == expected
  end

  # @tag :pending
  test "Orange and orange" do
    colors = [:orange, :orange]
    output = ResistorColorDuo.value(colors)
    expected = 33

    assert output == expected
  end

  # @tag :pending
  test "Ignore additional colors" do
    colors = [:green, :brown, :orange]
    output = ResistorColorDuo.value(colors)
    expected = 51

    assert output == expected
  end

  # @tag :pending
  test "Black and brown, one digit" do
    colors = [:black, :brown]
    output = ResistorColorDuo.value(colors)
    expected = 1

    assert output == expected
  end
end
