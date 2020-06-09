defmodule DNATest do
  use ExUnit.Case

  describe "encode to 4-bit encoding" do
    # @tag :pending
    test "?\\s to 0b0000", do: assert DNA.encode_nucleotide(?\s) == 0b0000
    @tag :pending
    test "?A to 0b0001", do: assert DNA.encode_nucleotide(?A) == 0b0001
    @tag :pending
    test "?C to 0b0010", do: assert DNA.encode_nucleotide(?C) == 0b0010
    @tag :pending
    test "?G to 0b0100", do: assert DNA.encode_nucleotide(?G) == 0b0100
    @tag :pending
    test "?T to 0b1000", do: assert DNA.encode_nucleotide(?T) == 0b1000
  end

  describe "decode to codepoint" do
    @tag :pending
    test "0b0000 to ?\\s", do: assert DNA.decode_nucleotide(0b0000) == ?\s
    @tag :pending
    test "0b0001 to ?A", do: assert DNA.decode_nucleotide(0b0001) == ?A
    @tag :pending
    test "0b0010 to ?C", do: assert DNA.decode_nucleotide(0b0010) == ?C
    @tag :pending
    test "0b0100 to ?G", do: assert DNA.decode_nucleotide(0b0100) == ?G
    @tag :pending
    test "0b1000 to ?T", do: assert DNA.decode_nucleotide(0b1000) == ?T
  end

  describe "encoding" do
    @tag :pending
    test "' '", do: assert DNA.encode(' ') == <<0b0000::4>>
    @tag :pending
    test "'A'", do: assert DNA.encode('A') == <<0b0001::4>>
    @tag :pending
    test "'C'", do: assert DNA.encode('C') == <<0b0010::4>>
    @tag :pending
    test "'G'", do: assert DNA.encode('G') == <<0b0100::4>>
    @tag :pending
    test "'T'", do: assert DNA.encode('T') == <<0b1000::4>>
    @tag :pending
    test "' ACGT'", do: assert DNA.encode(' ACGT') == <<0b0000::4, 0b0001::4, 0b0010::4, 0b0100::4, 0b1000::4>>
    @tag :pending
    test "'TGCA '", do: assert DNA.encode('TGCA ') == <<0b1000::4, 0b0100::4, 0b0010::4, 0b0001::4, 0b0000::4>>
  end

  describe "decoding" do
    @tag :pending
    test "' '", do: assert DNA.decode(<<0b0000::4>>) == ' '
    @tag :pending
    test "'A'", do: assert DNA.decode(<<0b0001::4>>) == 'A'
    @tag :pending
    test "'C'", do: assert DNA.decode(<<0b0010::4>>) == 'C'
    @tag :pending
    test "'G'", do: assert DNA.decode(<<0b0100::4>>) == 'G'
    @tag :pending
    test "'T'", do: assert DNA.decode(<<0b1000::4>>) == 'T'
    @tag :pending
    test "' ACGT'", do: assert DNA.decode(<<0b0000::4, 0b0001::4, 0b0010::4, 0b0100::4, 0b1000::4>>) == ' ACGT'
    @tag :pending
    test "'TGCA '", do: assert DNA.decode(<<0b1000::4, 0b0100::4, 0b0010::4, 0b0001::4, 0b0000::4>>) == 'TGCA '
  end
end
