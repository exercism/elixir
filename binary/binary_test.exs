if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("binary.exs")
end

ExUnit.start

defmodule BinaryTest do
  use ExUnit.Case, async: true

  test "binary 1 is decimal 1" do
    assert Binary.to_decimal("1") == 1
  end

  test "binary 10 is decimal 2" do
    assert Binary.to_decimal("10") == 2
  end

  test "binary 11 is decimal 3" do
    assert Binary.to_decimal("11") == 3
  end

  test "binary 100 is decimal 4" do
    assert Binary.to_decimal("100") == 4
  end

  test "binary 1001 is decimal 9" do
    assert Binary.to_decimal("1001") == 9
  end

  test "binary 11010 is decimal 26" do
    assert Binary.to_decimal("11010") == 26
  end

  test "binary 10001101000 is decimal 1128" do
    assert Binary.to_decimal("10001101000") == 1128
  end

  test "invalid binary is decimal 0" do
    assert Binary.to_decimal("carrot") == 0
  end
end
