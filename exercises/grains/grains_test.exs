if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("grains.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

# NOTE: :math.pow/2 doesn't do what you'd expect:
# `:math.pow(2, 64) == :math.pow(2, 64) - 1` is true.
#
# It's best to avoid functions operating on floating point numbers for very
# large numbers.

defmodule GrainsTest do
  use ExUnit.Case

  # @tag :skip
  test "square 1" do
    assert Grains.square(1) === 1
  end

  @tag :skip
  test "square 2" do
    assert Grains.square(2) === 2
  end

  @tag :skip
  test "square 3" do
    assert Grains.square(3) === 4
  end

  @tag :skip
  test "square 4" do
    assert Grains.square(4) === 8
  end

  @tag :skip
  test "square 16" do
    assert Grains.square(16) === 32768
  end

  @tag :skip
  test "square 32" do
    assert Grains.square(32) === 2147483648
  end

  @tag :skip
  test "square 64" do
    assert Grains.square(64) === 9223372036854775808
  end

  @tag :skip
  test "total grains" do
    assert Grains.total === 18446744073709551615
  end
end
