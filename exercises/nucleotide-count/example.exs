defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """

  def count(strand, nucleotide) when nucleotide in @nucleotides do
    Enum.count(strand, &(&1 == nucleotide))
  end

  def count(_strand, _nucleotide), do: raise(ArgumentError)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """

  def histogram(strand) do
    Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
  end
end
