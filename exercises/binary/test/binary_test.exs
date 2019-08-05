defmodule BinaryTest do
  use ExUnit.Case

  # @tag :pending
  test "binary 1 is decimal 1" do
    assert Binary.to_decimal("1") == 1
  end

  @tag :pending
  test "binary 10 is decimal 2" do
    assert Binary.to_decimal("10") == 2
  end

  @tag :pending
  test "binary 11 is decimal 3" do
    assert Binary.to_decimal("11") == 3
  end

  @tag :pending
  test "binary 100 is decimal 4" do
    assert Binary.to_decimal("100") == 4
  end

  @tag :pending
  test "binary 1001 is decimal 9" do
    assert Binary.to_decimal("1001") == 9
  end

  @tag :pending
  test "binary 11010 is decimal 26" do
    assert Binary.to_decimal("11010") == 26
  end

  @tag :pending
  test "binary 10001101000 is decimal 1128" do
    assert Binary.to_decimal("10001101000") == 1128
  end

  @tag :pending
  test "invalid binary is decimal 0" do
    assert Binary.to_decimal("carrot") == 0
  end

  @tag :pending
  test "invalid binary is decimal 0 II" do
    assert Binary.to_decimal("convert01") == 0
  end

  @tag :pending
  test "invalid binary is decimal 0 III" do
    assert Binary.to_decimal("10convert") == 0
  end

  @tag :pending
  test "invalid binary is decimal 0 IV" do
    assert Binary.to_decimal("1carrot0") == 0
  end

  @tag :pending
  test "22 is not a binary number" do
    assert Binary.to_decimal("22") == 0
  end
end
