- The [binary][binary] type is a specialization of the [bitstring][bitstring] type.
- Binaries are made up of [bytes][wiki-byte].
  - Bytes are 8 [bits][wiki-bit].
  - Bytes can represent numbers from `0` to `255`
  - [Hexadecimal][wiki-hexadecimal] integer values are common when working with bytes: `0x00` to `0xFF`.
- Binary literals are defined using the [`<<>>` special form][special-form].
  - If you use an integer larger than `255` for a byte, only the last 8 bits are used, unless you specify the [unit and/or size to use][bin-size] using the [`::`][typespec] operator.
- [`<>/2`][bin-concat] can be used to concatenate bitstrings/binaries/strings.

```elixir
<<255>> == <<0xFF>>
<<256>> == <<0>> # Overflowing bits are truncated
<<256::size(16)>> == <<1, 0>>

<<"Hello">> == <<72, 101, 108, 108, 111>>
```

> A _null-byte_ is another name for `<<0>>`

## Strings are encoded binary data

- Strings are encoded binary data in [UTF-8][wiki-utf8] format.
  - They are encoded in 8-bit (one-byte) chunks, using up to 4 bytes to represent more than 255 characters.
  - The [length of a string][string-length] may not be the same as its [byte size][byte-size].

```elixir
# This string has a string length of 5, but is made up of 7 bytes
string = "cześć"
String.length(string) != byte_size(string)

# Even emoji strings are encoded binaries
"👍" == <<240, 159, 145, 141>>
```

## Pattern Matching on binary data

- Binaries can be [pattern matched as a whole or using the special form][special-form] to match just one part.
  - Only the last portion in a pattern match may have a variable size.

```elixir
# Ignore the first 8 bytes, bind the remaining variable sized binary to `body`
<<_::binary-size(8), body::binary>>
```

This can be also done for strings:

```elixir
# bind the first 5 bytes to `name`,
# match the string literal " the ",
# bind remaining bytes to `species`
<<name::binary-size(5), " the ", species::binary>> = <<"Frank the Walrus">>
{name, species}
# => {"Frank", "Walrus"}
```

[bin-concat]: https://hexdocs.pm/elixir/Kernel.html#%3C%3E/2
[bin-size]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-unit-and-size
[binary]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#binaries
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[byte-size]: https://hexdocs.pm/elixir/Kernel.html#byte_size/1
[special-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[string-length]: https://hexdocs.pm/elixir/String.html#length/1
[wiki-bit]: https://en.wikipedia.org/wiki/Bit
[wiki-byte]: https://en.wikipedia.org/wiki/Byte
[wiki-hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[wiki-utf8]: https://en.wikipedia.org/wiki/UTF-8
