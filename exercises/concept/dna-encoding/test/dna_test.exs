defmodule DNATest do
  use ExUnit.Case

  describe "encode to 4-bit encoding" do
    @tag task_id: 1
    test "?\\s to 0b0000", do: assert(DNA.encode_nucleotide(?\s) == 0b0000)
    @tag task_id: 1
    test "?A to 0b0001", do: assert(DNA.encode_nucleotide(?A) == 0b0001)
    @tag task_id: 1
    test "?C to 0b0010", do: assert(DNA.encode_nucleotide(?C) == 0b0010)
    @tag task_id: 1
    test "?G to 0b0100", do: assert(DNA.encode_nucleotide(?G) == 0b0100)
    @tag task_id: 1
    test "?T to 0b1000", do: assert(DNA.encode_nucleotide(?T) == 0b1000)
  end

  describe "decode to code point" do
    @tag task_id: 2
    test "0b0000 to ?\\s", do: assert(DNA.decode_nucleotide(0b0000) == ?\s)
    @tag task_id: 2
    test "0b0001 to ?A", do: assert(DNA.decode_nucleotide(0b0001) == ?A)
    @tag task_id: 2
    test "0b0010 to ?C", do: assert(DNA.decode_nucleotide(0b0010) == ?C)
    @tag task_id: 2
    test "0b0100 to ?G", do: assert(DNA.decode_nucleotide(0b0100) == ?G)
    @tag task_id: 2
    test "0b1000 to ?T", do: assert(DNA.decode_nucleotide(0b1000) == ?T)
  end

  describe "encoding" do
    @tag task_id: 3
    test "' '", do: assert(DNA.encode(~c" ") == <<0b0000::4>>)
    @tag task_id: 3
    test "'A'", do: assert(DNA.encode(~c"A") == <<0b0001::4>>)
    @tag task_id: 3
    test "'C'", do: assert(DNA.encode(~c"C") == <<0b0010::4>>)
    @tag task_id: 3
    test "'G'", do: assert(DNA.encode(~c"G") == <<0b0100::4>>)
    @tag task_id: 3
    test "'T'", do: assert(DNA.encode(~c"T") == <<0b1000::4>>)

    @tag task_id: 3
    test "' ACGT'",
      do:
        assert(DNA.encode(~c" ACGT") == <<0b0000::4, 0b0001::4, 0b0010::4, 0b0100::4, 0b1000::4>>)

    @tag task_id: 3
    test "'TGCA '",
      do:
        assert(DNA.encode(~c"TGCA ") == <<0b1000::4, 0b0100::4, 0b0010::4, 0b0001::4, 0b0000::4>>)
  end

  describe "decoding" do
    @tag task_id: 4
    test "' '", do: assert(DNA.decode(<<0b0000::4>>) == ~c" ")
    @tag task_id: 4
    test "'A'", do: assert(DNA.decode(<<0b0001::4>>) == ~c"A")
    @tag task_id: 4
    test "'C'", do: assert(DNA.decode(<<0b0010::4>>) == ~c"C")
    @tag task_id: 4
    test "'G'", do: assert(DNA.decode(<<0b0100::4>>) == ~c"G")
    @tag task_id: 4
    test "'T'", do: assert(DNA.decode(<<0b1000::4>>) == ~c"T")

    @tag task_id: 4
    test "' ACGT'",
      do:
        assert(DNA.decode(<<0b0000::4, 0b0001::4, 0b0010::4, 0b0100::4, 0b1000::4>>) == ~c" ACGT")

    @tag task_id: 4
    test "'TGCA '",
      do:
        assert(DNA.decode(<<0b1000::4, 0b0100::4, 0b0010::4, 0b0001::4, 0b0000::4>>) == ~c"TGCA ")
  end
end
