# Introduction

## Bitstrings

Working with binary data is an important concept in any language, and Elixir provides an elegant syntax to write, match, and construct binary data.

In Elixir, binary data is referred to as the bitstring type. The binary data _type_ (not to be confused with binary data in general) is a specific form of a bitstring, which we will discuss in a later exercise.

Bitstring literals are defined using the bitstring special form `<<>>`. When defining a bitstring literal, it is defined in segments. Each segment has a value and type, separated by the `::` operator. The type specifies how many bits will be used to encode the value. The type can be omitted completely, which will default to a 8-bit integer value.

```elixir
# This defines a bitstring with three segments of a single bit each
<<0::1, 1::1, 0::1>>
```

Specifying the type as `::1` is a shorthand for writing `::size(1)`. You need to use the longer syntax if the bit size comes from a variable.

### Binary

When writing binary integer literals, we can write them directly in base-2 notation by prefixing the literal with `0b`. Note that they will be anyway displayed as decimal numbers when printed in tests results or when using iex.

```elixir
<<0b1011::4>> == <<11::4>>
# => true
```

### Truncating

If the value of the segment overflows the capacity of the segment's type, it will be truncated from the left.

```elixir
<<0b1011::3>> == <<0b0011::3>>
# => true
```

### Concatenating

We can combine bitstrings stored in variables using the special form. The `::bistring` type must be used when concatenating two bitstrings of unknown sizes.

```elixir
first = <<0b110::3>>
second = <<0b001::3>>
combined = <<first::bitstring, second::bitstring>>
# => <<49::size(6)>>
```

### Pattern matching

Pattern matching can also be done to obtain the value from within the special form. The `::bitstring` type must be used to pattern match on a bitstring of an unknown size. It can only be used for the last fragment of the bitstring.

```elixir
<<value::4, rest::bitstring>> = <<0b01101001::8>>
value == 0b0110
# => true
```

### Inspecting bitstrings

~~~~exericism/note
Bitstrings might be printed (by the test runner or in iex) in a different format than the format that was used to create them. This often causes confusion when learning bistrings.
~~~~

By default, bitstrings are displayed in fragments of 8 bits (a byte), even if you created them with fragments of a different size.

```elixir
<<2011::11>>
# => <<251, 3::size(3)>>
```

If you create a bitstring that represents a printable UTF-8 encoded string, it gets displayed as a string.

```elixir
<<>>
# => ""

<<65, 66, 67>>
# => "ABC"
```
