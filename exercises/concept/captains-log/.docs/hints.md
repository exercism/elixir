## General

- Read about using Erlang libraries in the [official Getting Started guide][getting-started-erlang-libraries], and in particular about [formatting strings][getting-started-formatted-text-output].

## 1. Generate a random planet

- Use the provided module attribute with a list of letters representing planetary classes.
- There is a [built-in function][enum-random] for choosing an element from a list at random.

## 2. Generate a random starship registry number

- [A range][range-macro] is a data structure representing a sequence of consecutive integers.
- There is a [build-in function][enum-random] for choosing an element from a range at random.

## 3. Generate a random stardate

- There is no Elixir function that would return a random float.
- There is a [built-in Erlang function][erl-rand-uniform] that returns a random float x where `0.0 <= x < 1.0`.
- If `x` belongs to a range `0.0 <= x < 1.0`, but you need a number from a different range `a <= x < b`, you can shift x's range by multiplying it by the range's width (`b - a`) and adding the range's start (`a`). That is: `x * (b - a) + a`.

## 4. Format the stardate

- There is no Elixir function that would be able to, in a single step, format a float as a string with a given precision.
- There is a [built-in Erlang function][erl-io-lib-format] that takes a format string and a list of data, and returns a charlist.
- There is a [built-in function][to-string] that changes a charlist to a string.
- The format string of that function contains control sequences.
- A control sequence starts with `~` and has the pattern `~F.P.PadModC`, where `F` stands for the width of the output, `P` stands for the precision, `Pad` stands for the padding character, `Mod` stands for the control sequence modifier, and `C` is the type of the control sequence.
- To format a float with a desired precision, a control sequence with the pattern `~P.C` will suffice.
- The control sequence type for floats is `f`.

[getting-started-erlang-libraries]: https://elixir-lang.org/getting-started/erlang-libraries.html
[getting-started-formatted-text-output]: https://elixir-lang.org/getting-started/erlang-libraries.html#formatted-text-output
[enum-random]: https://hexdocs.pm/elixir/Enum.html#random/1
[range-macro]: https://hexdocs.pm/elixir/Kernel.html#../2
[erl-rand-uniform]: http://erlang.org/doc/man/rand.html#uniform-0
[erl-io-lib-format]: http://erlang.org/doc/man/io_lib.html#format-2
[to-string]: https://hexdocs.pm/elixir/Kernel.html#to_string/1
