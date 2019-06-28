if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rna_transcription.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

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
  test "transcribes all dna nucleotides to rna equivalents" do
    assert RNATranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
  end
  
  @tag :pending
  test "transcribes very long dna" do
    dna_list = Enum.reduce(1..500000, [], 
                         fn x, acc -> if x <= 250000, do: [?A | acc], else: [?C | acc]
                         end)
    rna_list = Enum.reduce(1..500000, [],
                         fn x, acc -> if x <= 250000, do: [?U | acc], else: [?G | acc]
                         end)
    
    assert RNATranscription.to_rna(dna_list) == rna_list
  end
end
