defmodule ResistorColorTest do
  use ExUnit.Case

  # @tag :pending
  test "returns black color code" do
    assert ResistorColor.code(:black) == 0
  end

  @tag :pending
  test "returns brown color code" do
    assert ResistorColor.code(:brown) == 1
  end

  @tag :pending
  test "returns red color code" do
    assert ResistorColor.code(:red) == 2
  end

  @tag :pending
  test "returns orange color code" do
    assert ResistorColor.code(:orange) == 3
  end

  @tag :pending
  test "returns yellow color code" do
    assert ResistorColor.code(:yellow) == 4
  end

  @tag :pending
  test "returns green color code" do
    assert ResistorColor.code(:green) == 5
  end

  @tag :pending
  test "returns blue color code" do
    assert ResistorColor.code(:blue) == 6
  end

  @tag :pending
  test "returns violet color code" do
    assert ResistorColor.code(:violet) == 7
  end

  @tag :pending
  test "returns grey color code" do
    assert ResistorColor.code(:grey) == 8
  end

  @tag :pending
  test "returns white color code" do
    assert ResistorColor.code(:white) == 9
  end
end
