if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("protein_translation.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ProteinTranslationTest do
  use ExUnit.Case

  # @tag :pending
  test "AUG translates to methionine" do
    assert ProteinTranslation.of_codon("AUG") == {:ok, "Methionine"}
  end

  @tag :pending
  test "identifies Phenylalanine codons" do
    assert ProteinTranslation.of_codon("UUU") == {:ok, "Phenylalanine"}
    assert ProteinTranslation.of_codon("UUC") == {:ok, "Phenylalanine"}
  end

  @tag :pending
  test "identifies Leucine codons" do
    assert ProteinTranslation.of_codon("UUA") == {:ok, "Leucine"}
    assert ProteinTranslation.of_codon("UUG") == {:ok, "Leucine"}
  end

  @tag :pending
  test "identifies Serine codons" do
    assert ProteinTranslation.of_codon("UCU") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCC") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCA") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCG") == {:ok, "Serine"}
  end

  @tag :pending
  test "identifies Tyrosine codons" do
    assert ProteinTranslation.of_codon("UAU") == {:ok, "Tyrosine"}
    assert ProteinTranslation.of_codon("UAC") == {:ok, "Tyrosine"}
  end

  @tag :pending
  test "identifies Cysteine codons" do
    assert ProteinTranslation.of_codon("UGU") == {:ok, "Cysteine"}
    assert ProteinTranslation.of_codon("UGC") == {:ok, "Cysteine"}
  end

  @tag :pending
  test "identifies Tryptophan codons" do
    assert ProteinTranslation.of_codon("UGG") == {:ok, "Tryptophan"}
  end

  @tag :pending
  test "identifies stop codons" do
    assert ProteinTranslation.of_codon("UAA") == {:ok, "STOP"}
    assert ProteinTranslation.of_codon("UAG") == {:ok, "STOP"}
    assert ProteinTranslation.of_codon("UGA") == {:ok, "STOP"}
  end

  @tag :pending
  test "translates rna strand into correct protein" do
    strand = "AUGUUUUGG"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine Tryptophan)}
  end

  @tag :pending
  test "stops translation if stop codon present" do
    strand = "AUGUUUUAA"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine)}
  end

  @tag :pending
  test "stops translation of longer strand" do
    strand = "UGGUGUUAUUAAUGGUUU"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Tryptophan Cysteine Tyrosine)}
  end

  @tag :pending
  test "invalid RNA" do
    assert ProteinTranslation.of_rna("CARROT") == {:error, "invalid RNA"}
  end

  @tag :pending
  test "invalid codon at end of RNA" do
    assert ProteinTranslation.of_rna("UUUROT") == {:error, "invalid RNA"}
  end

  @tag :pending
  test "invalid codon" do
    assert ProteinTranslation.of_codon("INVALID") == {:error, "invalid codon"}
  end
end
