defmodule RNATranscription do
  @doc """
  Transcribes a character list representing RNATranscription nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  def to_rna(dna) do
    Enum.map(dna, &transcribe(&1))
  end

  defp transcribe(?C), do: ?G
  defp transcribe(?G), do: ?C
  defp transcribe(?A), do: ?U
  defp transcribe(?T), do: ?A
end
