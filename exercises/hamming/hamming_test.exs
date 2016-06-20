if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("hamming.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

#   @tag :pending
  test "hamming distance for strands of the same length are ok" do
    assert {:ok, _} = DNA.hamming_distance('', '')
  end

  @tag :pending
  test "hamming distance is undefined for strands of different lengths" do
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC')
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC')
  end

  @tag :pending
  test "no difference between empty strands" do
    assert {:ok, 0} = DNA.hamming_distance('', '')
  end

  @tag :pending
  test "no difference between identical strands" do
    assert {:ok, 0} = DNA.hamming_distance('GGACTGA', 'GGACTGA')
  end

  @tag :pending
  test "small hamming distance in middle somewhere" do
    assert {:ok, 1} = DNA.hamming_distance('GGACG', 'GGTCG')
  end

  @tag :pending
  test "distance with same nucleotides in different locations" do
    assert {:ok, 2} = DNA.hamming_distance('TAG', 'GAT')
  end

  @tag :pending
  test "larger distance" do
    assert {:ok, 2} = DNA.hamming_distance('ACCAGGG', 'ACTATGG')
  end
end
