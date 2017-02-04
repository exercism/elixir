if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rle.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RunLengthEncoderTest do
  use ExUnit.Case

  test "empty string returns empty" do
    assert RunLengthEncoder.encode("") === ""
  end

  @tag :pending
  test "simple string gets encoded" do
    assert RunLengthEncoder.encode("AAA") === "3A"
  end

  @tag :pending
  test "string with no repeated letters" do
    assert RunLengthEncoder.encode("HORSE") == "HORSE"
  end

  @tag :pending
  test "string with some repeated letters" do
    assert RunLengthEncoder.encode("MOOSE") == "M2OSE"
  end

  @tag :pending
  test "an even more complex string" do
    assert RunLengthEncoder.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") === "12WB12W3B24WB"
  end

  @tag :pending
  test "it decodes an encoded simple string" do
    assert RunLengthEncoder.decode("3A") === "AAA"
  end

  @tag :pending
  test "it decodes a more complicated string" do
    assert RunLengthEncoder.decode("12WB12W3B24WB") === "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
  end
end
