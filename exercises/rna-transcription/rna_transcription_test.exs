if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rna_transcription.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule RNATranscriptionTest do
  use ExUnit.Case

  # @tag :skip
  test "transcribes guanine to cytosine" do
    assert RNATranscription.to_rna('G') == 'C'
  end

  @tag :skip
  test "transcribes cytosine to guanine" do
    assert RNATranscription.to_rna('C') == 'G'
  end

  @tag :skip
  test "transcribes thymidine to adenine" do
    assert RNATranscription.to_rna('T') == 'A'
  end

  @tag :skip
  test "transcribes adenine to uracil" do
    assert RNATranscription.to_rna('A') == 'U'
  end

  @tag :skip
  test "it transcribes all dna nucleotides to rna equivalents" do
    assert RNATranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
  end
end
