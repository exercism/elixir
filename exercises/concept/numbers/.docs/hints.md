## General

- Read about basic arithmetic in the official [Getting Started Elixir guide][getting-started-basic-arithmetic].
- Browse the [`Float`][float-functions] and [`Kernel`][kernel-arithmetic-operators] modules to learn about functions and operators that work with floats.

## 1. Calculate the daily rate given an hourly rate

- [Basic arithmetic operations][kernel-arithmetic-operators] where one argument is an integer, and the other is a float, will return a float.

## 2. Calculate the monthly rate, given an hourly rate and a discount

- There is a [built-in function][kernel-trunc] for changing floats to integers.
- There is a [built-in function][float-ceil] for rounding floats up.

## 3. Calculate the number of workdays given a budget, hourly rate and discount

- There is a [built-in function][float-floor] for rounding floats down with desired precision.

[getting-started-basic-arithmetic]: https://elixir-lang.org/getting-started/basic-types.html#basic-arithmetic
[kernel-arithmetic-operators]: https://hexdocs.pm/elixir/Kernel.html#*/2
[kernel-trunc]: https://hexdocs.pm/elixir/Kernel.html#trunc/1
[float-functions]: https://hexdocs.pm/elixir/Float.html#functions
[float-ceil]: https://hexdocs.pm/elixir/Float.html#ceil/2
[float-floor]: https://hexdocs.pm/elixir/Float.html#floor/2
