if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("point_mutations.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule DNATest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "no difference between empty strands" do
    assert DNA.hamming_distance('', '') == 0
  end

  @tag :pending
  test "no difference between identical strands" do
    assert DNA.hamming_distance('GGACTGA', 'GGACTGA') == 0
  end

  @tag :pending
  test "small hamming distance in middle somewhere" do
    assert DNA.hamming_distance('GGACG', 'GGTCG') == 1
  end

  @tag :pending
  test "larger distance" do
    assert DNA.hamming_distance('ACCAGGG', 'ACTATGG') == 2
  end

  @tag :pending
  test "hamming distance is undefined for strands of different lengths" do
    assert DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC') == nil
    assert DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC') == nil
  end
end
