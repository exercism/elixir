# About

There are two different kinds of numbers in Elixir - integers and floats.

Floats are numbers with one or more digits behind the decimal separator. They use the 64-bit double precision floating-point format.

```elixir
float = 3.45
# => 3.45
```

Elixir also supports the scientific notation for floats.

```elixir
1.25e-2
# => 0.0125
```

## Rounding errors

Floats are infamous for their rounding errors.

```elixir
0.1 + 0.2
# => 0.30000000000000004
```

However, those kinds of errors are not specific to Elixir. They happen in all programming languages. This is because all data on our computers is stored and processed as binary code. In binary, only fractions whose denominator can be expressed as `2^n` (e.g. `1/4`, `3/8`, `5/16`) can be expressed exactly. Other fractions are expressed as estimations.

```elixir
# 3/4
Float.ratio(0.75)
# => {3, 4}

# 3/5
Float.ratio(0.6)
# => {5404319552844595, 9007199254740992}
```

You can learn more about this problem at [0.30000000000000004.com][0.30000000000000004.com]. The [Float Toy page][evanw.github.io-float-toy] has a nice, graphical explanation how a floating-point number's bits are converted to an actual floating-point value.

## Comparison

Integers and floats can be considered equal ([`==`][kernel-equal]) if they have the same value. However, being different types, they are never strictly equal ([`===`][kernel-strictly-equal]).

```elixir
1 == 1.0
# => true

1 === 1.0
# => false
```

## Conversion

Integers and floats can be mixed together in a single arithmetic expression. Using a float in an expression ensures the result will be a float too.

```elixir
2 * 3
# => 6

2 * 3.0
# => 6.0
```

Floats can be rounded (`round`), rounded up (`ceil`), or rounded down (`floor`).

To round a float into a float, use functions from the `Float` module ([`Float.round`][float-round], [`Float.ceil`][float-ceil], [`Float.floor`][float-floor]). To get an integer instead, use functions from the `Kernel` module ([`round`][kernel-round], [`ceil`][kernel-ceil], [`floor`][kernel-floor]).

Another method of changing a float into an integer is cutting off its decimal part with [`trunc`][kernel-trunc].

```elixir
Float.ceil(5.2)
# => 6.0

ceil(5.2)
# => 6

trunc(5.2)
# => 5
```

[0.30000000000000004.com]: https://0.30000000000000004.com/
[evanw.github.io-float-toy]: https://evanw.github.io/float-toy/
[arbitrary-precision-arithmetic]: https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic
[kernel-equal]: https://hexdocs.pm/elixir/Kernel.html#==/2
[kernel-strictly-equal]: https://hexdocs.pm/elixir/Kernel.html#===/2
[kernel-round]: https://hexdocs.pm/elixir/Kernel.html#round/1
[kernel-ceil]: https://hexdocs.pm/elixir/Kernel.html#ceil/1
[kernel-floor]: https://hexdocs.pm/elixir/Kernel.html#floor/1
[kernel-trunc]: https://hexdocs.pm/elixir/Kernel.html#trunc/1
[float-round]: https://hexdocs.pm/elixir/Float.html#round/2
[float-ceil]: https://hexdocs.pm/elixir/Float.html#ceil/2
[float-floor]: https://hexdocs.pm/elixir/Float.html#floor/2
