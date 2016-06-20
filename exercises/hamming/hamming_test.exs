if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("hamming.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

#   @tag :pending
  test "hamming distance for strands of same length returns :ok" do
    {code, _} = DNA.hamming_distance('', '')
    assert code == :ok
  end

  @tag :pending
  test "hamming distance is undefined for strands of different lengths" do
    assert DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC') == {:error, "Lists must be the same length."}
    assert DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC') == {:error, "Lists must be the same length."}
  end

  @tag :pending
  test "no difference between empty strands" do
    {:ok, distance} = DNA.hamming_distance('', '')
    assert distance == 0
  end

  @tag :pending
  test "no difference between identical strands" do
    {:ok, distance} = DNA.hamming_distance('GGACTGA', 'GGACTGA')
    assert distance == 0
  end

  @tag :pending
  test "small hamming distance in middle somewhere" do
    {:ok, distance} = DNA.hamming_distance('GGACG', 'GGTCG')
    assert distance == 1
  end

  @tag :pending
  test "distance with same nucleotides in different locations" do
    {:ok, distance} = DNA.hamming_distance('TAG', 'GAT')
    assert distance == 2
  end

  @tag :pending
  test "larger distance" do
    {:ok, distance} = DNA.hamming_distance('ACCAGGG', 'ACTATGG')
    assert distance == 2
  end

end
