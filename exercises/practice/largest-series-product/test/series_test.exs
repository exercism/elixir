defmodule SeriesTest do
  use ExUnit.Case

  # @tag :pending
  test "largest product if span equals length" do
    assert Series.largest_product("29", 2) == 18
  end

  @tag :pending
  test "largest product of 2" do
    assert Series.largest_product("0123456789", 2) == 72
  end

  @tag :pending
  test "largest product of 2 shuffled" do
    assert Series.largest_product("576802143", 2) == 48
  end

  @tag :pending
  test "largest product of 3" do
    assert Series.largest_product("0123456789", 3) == 504
  end

  @tag :pending
  test "largest product of 3 shuffled" do
    assert Series.largest_product("1027839564", 3) == 270
  end

  @tag :pending
  test "largest product of 5" do
    assert Series.largest_product("0123456789", 5) == 15120
  end

  @tag :pending
  test "some big number" do
    assert Series.largest_product("73167176531330624919225119674426574742355349194934", 6) ==
             23520
  end

  @tag :pending
  test "some other big number" do
    assert Series.largest_product("52677741234314237566414902593461595376319419139427", 6) ==
             28350
  end

  @tag :pending
  test "number with all zeroes" do
    assert Series.largest_product("0000", 2) == 0
  end

  @tag :pending
  test "number where all products are zero" do
    assert Series.largest_product("99099", 3) == 0
  end

  @tag :pending
  test "raises if span is too large" do
    assert_raise ArgumentError, fn ->
      Series.largest_product("123", 4)
    end
  end

  @tag :pending
  test "raises with empty string but non-zero span size" do
    assert_raise ArgumentError, fn ->
      Series.largest_product("", 1)
    end
  end

  @tag :pending
  test "raises with invalid character in digits" do
    assert_raise ArgumentError, fn ->
      Series.largest_product("1234a5", 2)
    end
  end

  @tag :pending
  test "raises with non-empty string and negative span size" do
    assert_raise ArgumentError, fn ->
      Series.largest_product("12345", -1)
    end
  end
end
