defmodule RunLengthEncoderTest do
  use ExUnit.Case

  test "encode empty string" do
    assert RunLengthEncoder.encode("") === ""
  end

  @tag :pending
  test "encode single characters only are encoded without count" do
    assert RunLengthEncoder.encode("XYZ") === "XYZ"
  end

  @tag :pending
  test "encode string with no single characters" do
    assert RunLengthEncoder.encode("AABBBCCCC") == "2A3B4C"
  end

  @tag :pending
  test "encode single characters mixed with repeated characters" do
    assert RunLengthEncoder.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") ===
             "12WB12W3B24WB"
  end

  @tag :pending
  test "encode multiple whitespace mixed in string" do
    assert RunLengthEncoder.encode("  hsqq qww  ") === "2 hs2q q2w2 "
  end

  @tag :pending
  test "encode lowercase characters" do
    assert RunLengthEncoder.encode("aabbbcccc") === "2a3b4c"
  end

  @tag :pending
  test "decode empty string" do
    assert RunLengthEncoder.decode("") === ""
  end

  @tag :pending
  test "decode single characters only" do
    assert RunLengthEncoder.decode("XYZ") === "XYZ"
  end

  @tag :pending
  test "decode string with no single characters" do
    assert RunLengthEncoder.decode("2A3B4C") == "AABBBCCCC"
  end

  @tag :pending
  test "decode single characters with repeated characters" do
    assert RunLengthEncoder.decode("12WB12W3B24WB") ===
             "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
  end

  @tag :pending
  test "decode multiple whitespace mixed in string" do
    assert RunLengthEncoder.decode("2 hs2q q2w2 ") === "  hsqq qww  "
  end

  @tag :pending
  test "decode lower case string" do
    assert RunLengthEncoder.decode("2a3b4c") === "aabbbcccc"
  end

  @tag :pending
  test "encode followed by decode gives original string" do
    original = "zzz ZZ  zZ"
    encoded = RunLengthEncoder.encode(original)
    assert RunLengthEncoder.decode(encoded) === original
  end
end
