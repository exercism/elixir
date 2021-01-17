Working with binary data is an important concept in any language, and Elixir provides an elegant syntax to write, match, and construct binary data.

In Elixir, binary data is referred to as the bitstring type. The binary data*type* (not to be confused with binary data in general) is a specific form of a bitstring, which we will discuss in a later exercise.

Bitstring literals are defined using the bitstring special form `<<>>`. When defining a bitstring literal, it is defined in segments. Each segment has a value and type, separated by the `::` operator. The type specifies how many bits will be used to encode the value. If the value of the segment overflows the capacity of the segment's type, it will be truncated from the left.

```elixir
# This defines a bitstring with three segments of a single bit each
<<0::1, 1::1, 0::1>> == <<0::size(1), 1::size(1), 0::size(1)>>
# => true
<<0::1, 1::1, 0::1>> == <<2::size(3)>>
# => true
<<2::1>> == <<0::1>>
# => true because of value overflow
```

When writing binary integer literals, we can write them directly in base-2 notation by prefixing the literal with `0b`.

```elixir
value = 0b11111011011 = 2011
```

By default, bitstrings are displayed in chunks of 8 bits (a byte).

```
<<value::11>>
# => <<251, 3::size(3)>>
```

### Constructing

We can combine bitstrings stored in variables using the special form:

```elixir
first = <<0b110::3>>
second = <<0b001::3>>
combined = <<first::bitstring, second::bitstring>>
# => <<49::size(6)>>
```

### Pattern matching

Pattern matching can also be done to obtain the value from within the special form:

```elixir
<<value::4, rest::bitstring>> = <<0b01101001::8>>
value == 0b0110
# => true
```
