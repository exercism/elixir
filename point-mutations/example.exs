defmodule DNA do
  @doc """
  Compute the hamming distance between two character lists.

  ## Examples

  iex> DNA.hamming_distance('ACCAGGG', 'ACTATGG')
  2
  """
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    pairs(strand1, strand2) |> count_mismatched
  end
  def hamming_distance(_, _), do: nil

  defp pairs(s1, s2),           do: Enum.zip(s1, s2)
  defp count_mismatched(pairs), do: Enum.count(pairs, fn({c1, c2}) -> c2 && (c1 != c2) end)
end
