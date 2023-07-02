defmodule HammingTest do
  use ExUnit.Case

  test "empty strands" do
    assert Hamming.hamming_distance(~c"", ~c"") == {:ok, 0}
  end

  @tag :pending
  test "single letter identical strands" do
    assert Hamming.hamming_distance(~c"A", ~c"A") == {:ok, 0}
  end

  @tag :pending
  test "single letter different strands" do
    assert Hamming.hamming_distance(~c"G", ~c"T") == {:ok, 1}
  end

  @tag :pending
  test "long identical strands" do
    assert Hamming.hamming_distance(~c"GGACTGAAATCTG", ~c"GGACTGAAATCTG") == {:ok, 0}
  end

  @tag :pending
  test "long different strands" do
    assert Hamming.hamming_distance(~c"GGACGGATTCTG", ~c"AGGACGGATTCT") == {:ok, 9}
  end

  @tag :pending
  test "disallow first strand longer" do
    assert {:error, "strands must be of equal length"} =
             Hamming.hamming_distance(~c"AATG", ~c"AAA")
  end

  @tag :pending
  test "disallow second strand longer" do
    assert {:error, "strands must be of equal length"} =
             Hamming.hamming_distance(~c"ATA", ~c"AGTG")
  end

  @tag :pending
  test "disallow empty first strand" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance(~c"", ~c"G")
  end

  @tag :pending
  test "disallow empty second strand" do
    assert {:error, "strands must be of equal length"} = Hamming.hamming_distance(~c"G", ~c"")
  end
end
