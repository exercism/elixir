# About

There are two different kinds of numbers in Elixir - integers and floats.

Integers are whole numbers.

```elixir
integer = 3
# => 3
```

A few useful functions for working with integers can be found in the [`Integer`][integer] module.

```elixir
Integer.digits(123)
# => [1, 2, 3]
```

Big integers (but also floats) are usually formatted by separating every 3 digits into groups with an underscore.

```elixir
1_000_000
# => 1000000
```

The maximum size of numbers in Elixir is only limited by the memory available on the system because Elixir uses [arbitrary precision arithmetic][arbitrary-precision-arithmetic].

Elixir also supports shortcut notations for entering [binary, octal, and hexadecimal integers][integers-in-other-bases].

```elixir
0b0100
# => 4

0o555
# => 365

0xFF
# => 255
```

## Comparison

Integers and floats can be considered equal ([`==`][kernel-equal]) if they have the same value. However, being different types, they are never strictly equal ([`===`][kernel-strictly-equal]).

```elixir
1 == 1.0
# => true

1 === 1.0
# => false
```

[arbitrary-precision-arithmetic]: https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic
[kernel-equal]: https://hexdocs.pm/elixir/Kernel.html#==/2
[kernel-strictly-equal]: https://hexdocs.pm/elixir/Kernel.html#===/2
[integer]: https://hexdocs.pm/elixir/Integer.html
[integers-in-other-bases]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
