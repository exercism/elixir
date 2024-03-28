# Introduction

Every fourth year is a leap year (with some exceptions), but let's consider this one condition first.

To solve the Leap problem, we must determine if a year is evenly divisible by a number or if a reminder of an integer division is zero.
Such operation in computing is called [modulo][modulo].

Unlike many languages, Elixir does not have [operators][operators] for either integer division or modulo.
Instead, it provides the [`Kernel.rem/2`][rem] and the [`Integer.mod/2`][mod] functions.

The two functions differ in how they work with negative divisors, but since, in this exercise,
all the divisors are non-negative, both could work, depending on the approach you choose.

## General solution

To check if a year is divisible by `n`, we can do `rem(year, n) == 0`.

Any approach to the problem will perform this check three times to see if a year is equally divisible by 4, 100 and 400.
What will differ between approaches is what Elixir features we will use to combine the checks.

## Approach: Boolean operators

The full rules are as follows:
A year is a leap year if
* it is divisible by 4
* but not divisible by 100
* unless it is divisible by 400

We can use [boolean operators][boolean-operators] to combine the checks, for example, like so:

```elixir
(rem(year, 4) == 0 and not rem(year, 100) == 0) or rem(year, 400) == 0
```
In the [boolean operators approach][operators-approach] we discuss the details of the solution.
It includes variations of the operators and their precedence.

## Approach: multiple clause function

Instead of using boolean operators, we can define multiple `leap_year?/1` function clauses with different guards.

```elixir
def leap_year?(year) when rem(year, 400) == 0, do: true
def leap_year?(year) when rem(year, 100) == 0, do: false
def leap_year?(year) when rem(year, 4) == 0, do: true
def leap_year?(_), do: false
```

In the [multiple clause function approach][clause-approach] we discuss why in this approach the `Integer.mod/2` function will not work.

## Approach: control flow structures

In addition to the above two approaches, control flow structures offer a number of solutions.
Here are two examples using `if` and `case`.

```elixir
if rem(year, 100) == 0 do
  rem(year, 400) == 0
else
  rem(year, 4) == 0
end
```

```elixir
case {rem(year, 400), rem(year, 100), rem(year, 4)} do
  {0, _, _} -> true
  {_, 0, _} -> false
  {_, _, 0} -> true
  _ -> false
end
```

We discuss these and other solutions depending on various control flow structures in the [control flow structures approach][flow-approach].

[modulo]: https://en.wikipedia.org/wiki/Modulo
[operators]: https://hexdocs.pm/elixir/operators.html
[rem]: https://hexdocs.pm/elixir/Kernel.html#rem/2
[mod]: https://hexdocs.pm/elixir/Integer.html#mod/2
[boolean-operators]: https://hexdocs.pm/elixir/operators.html#general-operators
[operators-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/operators
[clause-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/clauses
[flow-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/flow


