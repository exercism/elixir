defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  def to_rna(dna) do
    Enum.map(dna, &transcribe/1)
  end

  defp transcribe(?C), do: ?G
  defp transcribe(?G), do: ?C
  defp transcribe(?A), do: ?U
  defp transcribe(?T), do: ?A
end
