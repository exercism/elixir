if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("protein_translation.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ProteinTranslationTest do
  use ExUnit.Case

  #@tag :pending
  test "AUG translates to methionine" do
    assert "Methionine" == ProteinTranslation.of_codon("AUG")
  end

  @tag :pending
  test "identifies Phenylalanine codons" do
    assert "Phenylalanine" == ProteinTranslation.of_codon("UUU")
    assert "Phenylalanine" == ProteinTranslation.of_codon("UUC")
  end

  @tag :pending
  test "identifies Leucine codons" do
    assert "Leucine" == ProteinTranslation.of_codon("UUA")
    assert "Leucine" == ProteinTranslation.of_codon("UUG")
  end

  @tag :pending
  test "identifies Serine codons" do
    assert "Serine" == ProteinTranslation.of_codon("UCU")
    assert "Serine" == ProteinTranslation.of_codon("UCC")
    assert "Serine" == ProteinTranslation.of_codon("UCA")
    assert "Serine" == ProteinTranslation.of_codon("UCG")
  end

  @tag :pending
  test "identifies Tyrosine codons" do
    assert "Tyrosine" == ProteinTranslation.of_codon("UAU")
    assert "Tyrosine" == ProteinTranslation.of_codon("UAC")
  end

  @tag :pending
  test "identifies Cysteine codons" do
    assert "Cysteine" == ProteinTranslation.of_codon("UGU")
    assert "Cysteine" == ProteinTranslation.of_codon("UGC")
  end

  @tag :pending
  test "identifies Tryptophan codons" do
    assert "Tryptophan" == ProteinTranslation.of_codon("UGG")
  end

  @tag :pending
  test "identifies stop codons" do
    assert "STOP" == ProteinTranslation.of_codon("UAA")
    assert "STOP" == ProteinTranslation.of_codon("UAG")
    assert "STOP" == ProteinTranslation.of_codon("UGA")
  end

  @tag :pending
  test "translates rna strand into correct protein" do
    strand = "AUGUUUUGG"
    expected = ~w(Methionine Phenylalanine Tryptophan)
    assert expected == ProteinTranslation.of_rna(strand)
  end

  @tag :pending
  test "stops translation if stop codon present" do
    strand = "AUGUUUUAA"
    expected = ~w(Methionine Phenylalanine)
    assert expected == ProteinTranslation.of_rna(strand)
  end

  @tag :pending
  test "stops translation of longer strand" do
    strand = "UGGUGUUAUUAAUGGUUU"
    expected = ~w(Tryptophan Cysteine Tyrosine)
    assert expected == ProteinTranslation.of_rna(strand)
  end

  @tag :pending
  test "invalid RNA" do
    assert {:error, "invalid RNA"} == ProteinTranslation.of_rna("CARROT")
  end

  @tag :pending
  test "invalid codon" do
    assert {:error, "invalid codon"} == ProteinTranslation.of_codon("INVALID")
  end
end
