if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("hamming.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

  test "no difference between empty strands" do
    assert DNA.hamming_distance('', '') == {:ok, 0}
  end

  @tag :pending
  test "no difference between identical strands" do
    assert DNA.hamming_distance('GGACTGA', 'GGACTGA') == {:ok, 0}
  end

  @tag :pending
  test "small hamming distance in middle somewhere" do
    assert DNA.hamming_distance('GGACG', 'GGTCG') == {:ok, 1}
  end

  @tag :pending
  test "distance with same nucleotides in different locations" do
    assert DNA.hamming_distance('TAG', 'GAT') == {:ok, 2}
  end

  @tag :pending
  test "larger distance" do
    assert DNA.hamming_distance('ACCAGGG', 'ACTATGG') == {:ok, 2}
  end

  @tag :pending
  test "hamming distance is undefined for strands of different lengths" do
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC')
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC')
  end
end
