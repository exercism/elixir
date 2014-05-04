if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("largest_series_product.exs")
end

ExUnit.start

defmodule LargestSeriesProductTest do
  use ExUnit.Case, async: false

  test "digits" do
    assert Series.digits("0123456789") == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  test "same digits reversed" do
    assert Series.digits("9876543210") == [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  end

  test "fewer digits" do
    assert Series.digits("87654") == [8, 7, 6, 5, 4]
  end

  test "some other digits" do
    assert Series.digits("936923468") == [9, 3, 6, 9, 2, 3, 4, 6, 8]
  end

  test "slices of zero" do
    assert Series.digits("") == []
  end

  test "slices of two" do
    assert Series.slices("01234", 2) == [[0, 1], [1, 2], [2, 3], [3, 4]]
  end

  test "other slices of two" do
    assert Series.slices("98273463", 2) == [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
  end

  test "slices of three" do
    assert Series.slices("01234", 3) == [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
  end

  test "other slices of three" do
    assert Series.slices("982347", 3) == [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
  end

  test "largest product of 2" do
    assert Series.largest_product("0123456789", 2) == 72
  end

  test "largest product of a tiny number" do
    assert Series.largest_product("12", 2) == 2
  end

  test "another tiny number" do
    assert Series.largest_product("19", 2) == 9
  end

  test "largest product of 2 shuffled" do
    assert Series.largest_product("576802143", 2) == 48
  end

  test "largest product of 3" do
    assert Series.largest_product("0123456789", 3) == 504
  end

  test "largest product of 3 shuffled" do
    assert Series.largest_product("1027839564", 3) == 270
  end

  test "largest product of 5" do
    assert Series.largest_product("0123456789", 5) == 15120
  end

  test "some big number" do
    assert Series.largest_product("73167176531330624919225119674426574742355349194934", 6) == 23520
  end

  test "some other big number" do
    assert Series.largest_product("52677741234314237566414902593461595376319419139427", 6) == 28350
  end

  test "identity" do
    assert Series.largest_product("", 0) == 1
  end
end
