# About

[Bitstrings][bitstring] allow programmers to work with binary data effectively.

- You can construct bitstrings elegantly using the [`<<>>` special form][bitstring-form].

  ```elixir
  <<0b101::3>> == <<5::3>> and <<5::3>> == <<5::size(3)>>
  # => true

  first = <<0b110::3>>
  second = <<0b001::3>>
  combined = <<first::bitstring, second::bitstring>>
  # => <<49::size(6)>>
  ```

- You can match using the `<<>>` form and use that match to further [decompose binary data][bitstring-matching].

  ```elixir
  <<data_size::32, count::size(data_size)>> = <<8::32, 3::8>>
  # => <<0, 0, 0, 8, 3>>
  data_size
  # => 8
  count
  # => 3
  ```

- You can match on the remainder of the bitstring using `::bitstring`.

  ```elixir
  <<_::32, remainder::bitstring>> = <<8::32, 3::8>>
  # => <<0, 0, 0, 8, 3>>
  remainder
  # => <<3>>
  ```

- The binary data *type* is a specific type of bitstring where the number of bits is divisible by 8.
  - All binaries are bitstrings, but not all bitstrings are binaries.
- Elixir provides syntactic sugar for working with [integer literals][integer-literal] in different forms:
  - `0b1000001 = ?A = 65`

[integer-literal]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[bitstring-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[bitstring-matching]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-binary-bitstring-matching
