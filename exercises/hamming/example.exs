defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  def hamming_distance(strand1, strand2) when length(strand1) === length(strand2) do
    distance = pairs(strand1, strand2) |> count_mismatched
    {:ok, distance}
  end
  def hamming_distance(_, _), do: {:error, "Lists must be the same length"}

  defp pairs(s1, s2),           do: Enum.zip(s1, s2)
  defp count_mismatched(pairs), do: Enum.count(pairs, fn({c1, c2}) -> c2 && (c1 != c2) end)
end
