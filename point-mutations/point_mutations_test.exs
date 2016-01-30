Code.load_file("../file_loader.ex", __DIR__)
FileLoader.load("point_mutations", __DIR__)

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
