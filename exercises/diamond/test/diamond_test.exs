defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "letter A" do
    shape = Diamond.build_shape(?A)
    assert shape == "A\n"
  end

  @tag :pending
  test "letter C" do
    shape = Diamond.build_shape(?C)

    assert shape == """
           \s A \s
           \sB B\s
           C   C
           \sB B\s
           \s A \s
           """
  end

  @tag :pending
  test "letter E" do
    shape = Diamond.build_shape(?E)

    assert shape == """
           \s   A   \s
           \s  B B  \s
           \s C   C \s
           \sD     D\s
           E       E
           \sD     D\s
           \s C   C \s
           \s  B B  \s
           \s   A   \s
           """
  end
end
