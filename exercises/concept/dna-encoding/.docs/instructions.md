# Instructions

In your DNA research lab, you have been working through various ways to compress your research data to save storage space. One teammate suggests converting the DNA data to a binary representation:

| Nucleic Acid | Code   |
| ------------ | ------ |
| a space      | `0000` |
| A            | `0001` |
| C            | `0010` |
| G            | `0100` |
| T            | `1000` |

You ponder this, as it will potentially halve the required data storage costs, but at the expense of human readability. You decide to write a module to encode and decode your data to benchmark your savings.

## 1. Encode nucleic acid to binary value

Implement `encode_nucleotide/1` to accept the code point for the nucleic acid and return the integer value of the encoded code.

```elixir
DNA.encode_nucleotide(?A)
# => 1
# (which is equal to 0b0001)
```

## 2. Decode the binary value to the nucleic acid

Implement `decode_nucleotide/1` to accept the integer value of the encoded code and return the code point for the nucleic acid.

```elixir
DNA.decode_nucleotide(0b0001)
# => 65
# (which is equal to ?A)
```

## 3. Encode a DNA charlist

Implement `encode/1` to accept a charlist representing nucleic acids and gaps and return a bitstring of the encoded data.

```elixir
DNA.encode('AC GT')
# => <<18, 4, 8::size(4)>>
```

## 4. Decode a DNA bitstring

Implement `decode/1` to accept a bitstring representing nucleic acids and gaps and return the decoded data as a charlist.

```elixir
DNA.decode(<<132, 2, 1::size(4)>>)
# => 'TG CA'
```
