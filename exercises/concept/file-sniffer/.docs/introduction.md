# Introduction

## Binaries

Elixir provides an elegant syntax for working with binary data as we have seen with the `<<>>` special form provided for working with [bitstrings][exercism-bitstrings].

The binary type is a specialization on the bitstring type. Where bitstrings could be of any length (any number of [bits][wiki-bit]), binaries are where the number of bits can be evenly divided by 8. That is, when working with binaries, we often think of things in terms of [bytes][wiki-byte] (8 bits). A byte can represent integer numbers from `0` to `255`. It is common to work with byte values in [hexadecimal][wiki-hexadecimal], `0x00 - 0xFF`.

Binary literals are defined using the bitstring special form `<<>>`. When defining a binary literal, we can use integer and string literals. Integer values greater than 255 will overflow and only the last 8 bits of the integer will be used. By default, the `::binary` modifier is applied to the value. We can concatenate binaries with the `<>/2` operator.

```elixir
<<255>> == <<0xFF>>
# Overflowing bits are truncated
<<256>> == <<0>>
<<2, 4, 6, 8, 10, 12, 14, 16>> == <<0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10>>
```

A _null-byte_ is another name for `<<0>>`.

### Pattern matching on binary data

[Pattern matching][exercism-pattern-matching] is even extended to binaries, and we can pattern match on a portion of binary data much like we could for a list.

```elixir
# Ignore the first 8 bytes, match and bind the remaining to `body`
<<_::binary-size(8), body::binary>>
```

Like with other types of pattern matching, we can use this in function signatures to match when selecting from multiple function clauses.

[wiki-bit]: https://en.wikipedia.org/wiki/Bit
[wiki-byte]: https://en.wikipedia.org/wiki/Byte
[wiki-hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[exercism-bitstrings]: https://exercism.org/tracks/elixir/concepts/bitstrings
[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching
