defmodule HammingTest do
  use ExUnit.Case

  test "empty strands" do
    assert Hamming.hamming_distance('', '') == {:ok, 0}
  end

  @tag :pending
  test "single letter identical strands" do
    assert Hamming.hamming_distance('A', 'A') == {:ok, 0}
  end

  @tag :pending
  test "single letter different strands" do
    assert Hamming.hamming_distance('G', 'T') == {:ok, 1}
  end

  @tag :pending
  test "long identical strands" do
    assert Hamming.hamming_distance('GGACTGAAATCTG', 'GGACTGAAATCTG') == {:ok, 0}
  end

  @tag :pending
  test "long different strands" do
    assert Hamming.hamming_distance('GGACGGATTCTG', 'AGGACGGATTCT') == {:ok, 9}
  end

  @tag :pending
  test "disallow first strand longer" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance('AATG', 'AAA')
  end

  @tag :pending
  test "disallow second strand longer" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance('ATA', 'AGTG')
  end

  @tag :pending
  test "disallow empty first strand" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance('', 'G')
  end

  @tag :pending
  test "disallow empty second strand" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance('G', '')
  end
end
