if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("point_mutations.exs")
end

ExUnit.start

defmodule DNATest do
  use ExUnit.Case, async: true
  doctest DNA

  test "no difference between empty strands" do
    assert DNA.hamming_distance('', '') == 0
  end

  test "no difference between identical strands" do
    # assert DNA.hamming_distance('GGACTGA', 'GGACTGA') == 0
  end

  test "hamming distance in off by one strand" do
    # assert DNA.hamming_distance('GGACGGATTCTGACCTGGACTAATTTTGGGG', 'AGGACGGATTCTGACCTGGACTAATTTTGGGG') == 19
  end

  test "small hamming distance in middle somewhere" do
    # assert DNA.hamming_distance('GGACG', 'GGTCG') == 1
  end

  test "larger distance" do
    # assert DNA.hamming_distance('ACCAGGG', 'ACTATGG') == 2
  end

  test "ignores extra length on other strand when longer" do
    # assert DNA.hamming_distance('AAACTAGGGG', 'AGGCTAGCGGTAGGAC') == 3
  end

  test "ignores extra length on original strand when longer" do
    # assert DNA.hamming_distance('GACTACGGACAGGGTAGGGAAT', 'GACATCGCACACC') == 5
  end
end
