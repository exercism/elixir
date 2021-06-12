defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    translate_rna(rna, [])
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    translate_codon(codon)
  end

  @codons %{
    "Methionine" => ~w(AUG),
    "Phenylalanine" => ~w(UUU UUC),
    "Leucine" => ~w(UUA UUG),
    "Serine" => ~w(UCU UCC UCA UCG),
    "Tyrosine" => ~w(UAU UAC),
    "Cysteine" => ~w(UGU UGC),
    "Tryptophan" => ~w(UGG)
  }
  @stop ~w(UAA UAG UGA)

  defp translate_rna("", results), do: {:ok, Enum.reverse(results)}

  for codon <- @stop do
    defp translate_rna(unquote(codon) <> _rest, results), do: {:ok, Enum.reverse(results)}
    defp translate_codon(unquote(codon)), do: {:ok, "STOP"}
  end

  for {protein, codons} <- @codons,
      codon <- codons do
    defp translate_rna(unquote(codon) <> rest, results),
      do: translate_rna(rest, [unquote(protein) | results])

    defp translate_codon(unquote(codon)), do: {:ok, unquote(protein)}
  end

  defp translate_rna(_, _), do: {:error, "invalid RNA"}
  defp translate_codon(_), do: {:error, "invalid codon"}
end
