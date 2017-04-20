if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("diamond.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "letter A" do
    shape = Diamond.build_shape(?A)
    assert shape == "A"
  end

  @tag :pending
  test "letter C" do
    shape = Diamond.build_shape(?C)
    assert shape ==
      "  A  \n" <>
      " B B \n" <>
      "C   C\n" <>
      " B B \n" <>
      "  A  "
  end

  @tag :pending
  test "letter E" do
    shape = Diamond.build_shape(?E)
    assert shape ==
      "    A    \n" <>
      "   B B   \n" <>
      "  C   C  \n" <>
      " D     D \n" <>
      "E       E\n" <>
      " D     D \n" <>
      "  C   C  \n" <>
      "   B B   \n" <>
      "    A    "
  end
end
