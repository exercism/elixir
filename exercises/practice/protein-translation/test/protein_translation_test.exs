defmodule ProteinTranslationTest do
  use ExUnit.Case

  describe "of_codon" do
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
    test "incomplete codon" do
      assert ProteinTranslation.of_codon("UG") == {:error, "invalid codon"}
    end

    @tag :pending
    test "too long, invalid codon" do
      assert ProteinTranslation.of_codon("UGGG") == {:error, "invalid codon"}
    end

    @tag :pending
    test "known amino acids, but invalid codon" do
      assert ProteinTranslation.of_codon("AAA") == {:error, "invalid codon"}
    end

    @tag :pending
    test "unknown amino acids, not part of a codon" do
      assert ProteinTranslation.of_codon("XYZ") == {:error, "invalid codon"}
    end
  end

  describe "of_rna" do
    @tag :pending
    test "empty RNA sequence results in no proteins" do
      strand = ""
      assert ProteinTranslation.of_rna(strand) == {:ok, []}
    end

    @tag :pending
    test "translates rna strand into correct protein" do
      strand = "AUGUUUUGG"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine Tryptophan)}
    end

    @tag :pending
    test "sequence of two identical protein codons translates into two identical proteins" do
      strand = "UUUUUU"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Phenylalanine Phenylalanine)}
    end

    @tag :pending
    test "sequence of two different protein codons translates into two identical proteins" do
      strand = "UUAUUG"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Leucine Leucine)}
    end

    @tag :pending
    test "stops translation if stop codon preset at beginning of sequence" do
      strand = "UAGUGG"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w()}
    end

    @tag :pending
    test "stops translation if stop codon present at end of two-codon sequence" do
      strand = "UGGUAG"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Tryptophan)}
    end

    @tag :pending
    test "stops translation if stop codon present at end of three-codon sequence" do
      strand = "AUGUUUUAA"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine)}
    end

    @tag :pending
    test "stops translation if stop codon present in middle of three-codon sequence" do
      strand = "UGGUAGUGG"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Tryptophan)}
    end

    @tag :pending
    test "stops translation if stop codon present in middle of six-codon sequence" do
      strand = "UGGUGUUAUUAAUGGUUU"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Tryptophan Cysteine Tyrosine)}
    end

    @tag :pending
    test "incomplete codon, invalid RNA" do
      strand = "UG"
      assert ProteinTranslation.of_rna(strand) == {:error, "invalid RNA"}
    end

    @tag :pending
    test "known amino acids, but invalid codon, invalid RNA" do
      strand = "AAA"
      assert ProteinTranslation.of_rna(strand) == {:error, "invalid RNA"}
    end

    @tag :pending
    test "unknown amino acids, not part of a codon, invalid RNA" do
      strand = "XYZ"
      assert ProteinTranslation.of_rna(strand) == {:error, "invalid RNA"}
    end

    @tag :pending
    test "invalid codon at end of RNA" do
      strand = "UUUROT"
      assert ProteinTranslation.of_rna(strand) == {:error, "invalid RNA"}
    end

    @tag :pending
    test "incomplete RNA" do
      strand = "AUGU"
      assert ProteinTranslation.of_rna(strand) == {:error, "invalid RNA"}
    end

    @tag :pending
    test "incomplete RNA valid until a STOP codon" do
      strand = "UUCUUCUAAUGGU"
      assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Phenylalanine Phenylalanine)}
    end
  end
end
