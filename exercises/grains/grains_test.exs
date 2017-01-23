if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("grains.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

# NOTE: :math.pow/2 doesn't do what you'd expect:
# `:math.pow(2, 64) == :math.pow(2, 64) - 1` is true.
#
# It's best to avoid functions operating on floating point numbers for very
# large numbers.

defmodule GrainsTest do
  use ExUnit.Case

  # @tag :pending
  test "square 1" do
    assert Grains.square(1) === 1
  end

  @tag :pending
  test "square 2" do
    assert Grains.square(2) === 2
  end

  @tag :pending
  test "square 3" do
    assert Grains.square(3) === 4
  end

  @tag :pending
  test "square 4" do
    assert Grains.square(4) === 8
  end

  @tag :pending
  test "square 16" do
    assert Grains.square(16) === 32768
  end

  @tag :pending
  test "square 32" do
    assert Grains.square(32) === 2147483648
  end

  @tag :pending
  test "square 64" do
    assert Grains.square(64) === 9223372036854775808
  end

  @tag :pending
  test "total grains" do
    assert Grains.total === 18446744073709551615
  end

  @tag :pending
  test "square greater than 64 raises an exception" do
    catch_error Grains.square(65)
  end

  @tag :pending
  test "negative square raises an exception" do
    catch_error Grains.square(-1)
  end

  @tag :pending
  test "square 0 raises an exception" do
    catch_error Grains.square(0)
  end

end
