defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """

  def count(strand, nucleotide) when nucleotide in(@nucleotides) do
    validate!(strand)
    Enum.count strand, &(&1 == nucleotide)
  end
  def count(_strand, _nucleotide), do: raise ArgumentError

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """

  def histogram(strand) do
    Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
  end

  defp validate!(strand) do
    unless Enum.all?(strand, &(&1 in @nucleotides)), do: raise ArgumentError
  end
end
