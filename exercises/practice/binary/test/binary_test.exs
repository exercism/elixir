defmodule BinaryTest do
  use ExUnit.Case

  # @tag :pending
  test "binary 0 is decimal 0" do
    assert Binary.to_decimal("0") == 0
  end

  @tag :pending
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
  test "binary ignores leading zeros" do
    assert Binary.to_decimal("000011111") == 31
  end

  @tag :pending
  test "2 is not a valid binary digit" do
    assert Binary.to_decimal("2") == nil
  end

  @tag :pending
  test "a number containing a non-binary digit is invalid" do
    assert Binary.to_decimal("01201") == nil
  end

  @tag :pending
  test "a number with trailing non-binary characters is invalid" do
    assert Binary.to_decimal("10nope") == nil
  end

  @tag :pending
  test "a number with leading non-binary characters is invalid" do
    assert Binary.to_decimal("nope10") == nil
  end

  @tag :pending
  test "a number with internal non-binary characters is invalid" do
    assert Binary.to_decimal("10nope10") == nil
  end

  @tag :pending
  test "a number and a word whitespace separated is invalid" do
    assert Binary.to_decimal("001 nope") == nil
  end
end
