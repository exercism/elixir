## bitstrings

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

When writing binary integer literals, we can write them directly in base-2 notation by prefixing the literal with `0b`: E.g. `0b10 == 2`

```elixir
value = 0b11111011011 = 2011
<<value::11>>
# => <<251, 3::size(3)>>
# By default, bitstrings are displayed in chunks of 8 bits (a byte)
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

## tail-call-recursion

When recursing through enumerables [lists, bitstrings, strings], there are often two concerns:

- how much memory is required to store the trail of recursive function calls
- how to build the solution efficiently

To deal with these concerns an _accumulator_ may be used to pass the state of the function _so far_ until the result reaches the _base case_ and returns the value. An accumulator is a variable that is passed along in addition to the data.

```elixir
# Count the length of a list without an accumulator
def count([]), do: 0
def count([_head | tail]), do: 1 + count(tail)

# Count the length of a list with an accumulator
def count(list), do: do_count(list, 0)

defp do_count([], count), do: count
defp do_count([_head | tail], count), do: do_count(tail, count + 1)
```

The usage of an accumulator allows us to turn recursive functions into _tail-recursive_ functions. A function is tail-recursive if the _last_ thing executed by the function is a call to itself.
