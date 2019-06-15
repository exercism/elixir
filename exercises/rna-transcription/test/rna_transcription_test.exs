defmodule RNATranscriptionTest do
  use ExUnit.Case

  # @tag :pending
  test "transcribes guanine to cytosine" do
    assert RNATranscription.to_rna('G') == 'C'
  end

  @tag :pending
  test "transcribes cytosine to guanine" do
    assert RNATranscription.to_rna('C') == 'G'
  end

  @tag :pending
  test "transcribes thymidine to adenine" do
    assert RNATranscription.to_rna('T') == 'A'
  end

  @tag :pending
  test "transcribes adenine to uracil" do
    assert RNATranscription.to_rna('A') == 'U'
  end

  @tag :pending
  test "it transcribes all dna nucleotides to rna equivalents" do
    assert RNATranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
  end
end
