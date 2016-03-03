if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("dna.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

  # @tag :pending
  test "transcribes guanine to cytosine" do
    assert DNA.to_rna('G') == 'C'
  end

  @tag :pending
  test "transcribes cytosine to guanine" do
    assert DNA.to_rna('C') == 'G'
  end

  @tag :pending
  test "transcribes thymidine to adenine" do
    assert DNA.to_rna('T') == 'A'
  end

  @tag :pending
  test "transcribes adenine to uracil" do
    assert DNA.to_rna('A') == 'U'
  end

  @tag :pending
  test "it transcribes all dna nucleotides to rna equivalents" do
    assert DNA.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
  end
end
