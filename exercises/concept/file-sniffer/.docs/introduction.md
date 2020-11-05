## binaries

Elixir provides an elegant syntax for working with binary data as we have seen with the `<<>>` special form provided for working with _bitstrings_.

The binary type is a specialization on the bitstring type. Where bitstrings could be of any length (any number of [bits][wiki-bit]), binaries are where the number of [bits][wiki-bit] can be evenly divided by 8. That is, when working with binaries, we often think of things in terms of [bytes][wiki-byte] (8 [bits][wiki-bit]). A [byte][wiki-bytes] can represent integer numbers from `0` to `255`. It is common to work with [byte][wiki-byte] values in [hexadecimal][wiki-hexadecimal], `0x00 - 0xFF`.

Binary literals are defined using the bitstring special form `<<>>` to define a literal. When defining a literal, we can use integer and string literals. Integer values greater than 255 will overflow and only the last 8 bits of the integer will be used. By default, the `::binary` modifier is applied to the value. We can concatenate binaries with the `<>/2` operator.

```elixir
<<255>> == <<0xFF>>
<<256>> == <<0>> # Overflowing bits are truncated
<<2, 4, 6, 8, 10, 12, 14, 16>> == <<0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10>>
```

A _null-byte_ is another name for `<<0>>`

### Pattern matching on binary data

Pattern matching is even extended to binaries, and we can pattern match on a portion of binary data much like we could for a list.

```elixir
# Ignore the first 8 bytes, match and bind the remaining to `body
<<_::binary-size(8), body::binary>>
```

And like previous examples of pattern matching, we can use this in function signatures to match when selecting from multiple function clauses.

[wiki-bit]: https://en.wikipedia.org/wiki/Bit
[wiki-byte]: https://en.wikipedia.org/wiki/Byte
[wiki-hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[wiki-utf8]: https://en.wikipedia.org/wiki/UTF-8
