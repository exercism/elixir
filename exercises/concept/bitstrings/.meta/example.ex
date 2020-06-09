defmodule DNA do
  @moduledoc """
  Example solution for the `bitstrings` exercise.

  Written by Tim Austin, tim@neenjaw.com, June 2020.

   | NucleicAcid | Bits |
   | ----------- | ---- |
   |    ' '      | 0000 |
   |     A       | 0001 |
   |     C       | 0010 |
   |     G       | 0100 |
   |     T       | 1000 |
  """

  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], acc), do: acc
  defp do_encode([n | rest], acc) do
    do_encode(rest, <<acc::bitstring, encode_nucleotide(n)::4>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  def do_decode(<<>>, acc), do: acc |> Enum.reverse()
  def do_decode(<<n::4, rest::bitstring>>, acc), do: do_decode(rest, [decode_nucleotide(n) | acc])
end
