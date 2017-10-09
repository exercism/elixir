if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("hexadecimal.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule HexadecimalTest do
  use ExUnit.Case

  test "returns 1 when hex is 1" do
    assert Hexadecimal.to_decimal("1") == 1
  end

  @tag :pending
  test "returns 12 when hex is c" do
    assert Hexadecimal.to_decimal("c") == 12
  end

  @tag :pending
  test "hexadecimal is case insensitive" do
    assert Hexadecimal.to_decimal("C") == 12
  end

  @tag :pending
  test "returns 16 when hex is 10" do
    assert Hexadecimal.to_decimal("10") == 16
  end

  @tag :pending
  test "returns 175 when hex is af" do
    assert Hexadecimal.to_decimal("af") == 175
  end

  @tag :pending
  test "returns 256 when hex is 100" do
    assert Hexadecimal.to_decimal("100") == 256
  end

  @tag :pending
  test "returns 105_166 when hex is 19ace" do
    assert Hexadecimal.to_decimal("19ace") == 105_166
  end

  @tag :pending
  test "returns 0 when hex is invalid" do
    assert Hexadecimal.to_decimal("carrot") == 0
  end

  @tag :pending
  test "returns 0 when hex represents black" do
    assert Hexadecimal.to_decimal("000000") == 0
  end

  @tag :pending
  test "returns 16_777_215 when hex represents white" do
    assert Hexadecimal.to_decimal("ffffff") == 16_777_215
  end

  @tag :pending
  test "returns 16_776_960 when hex represents yellow" do
    assert Hexadecimal.to_decimal("ffff00") == 16_776_960
  end
end
