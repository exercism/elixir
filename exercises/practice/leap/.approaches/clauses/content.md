# Multiple clause function

```elixir
defmodule Year do
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) when rem(year, 400) == 0, do: true
  def leap_year?(year) when rem(year, 100) == 0, do: false
  def leap_year?(year) when rem(year, 4) == 0, do: true
  def leap_year?(_), do: false
end
```

In Elixir, functions can have multiple clauses.
Which one will be executed depends on parameter matching and guards.
When a function with multiple clauses is invoked, the parameters are compared to the definitions in the order in which they were defined, and only the first one matching will be invoked.

While in the [operators approach][operators-approach], it was possible to reorder expressions as long as the suitable boolean operators were used, in this approach, there is only one correct order of definitions.

In our case, the three guards in the function clauses are as follows:

[//]: # (elixir-formatter-disable-next-block)

```elixir
when rem(year, 400) == 0
when rem(year, 100) == 0
when rem(year, 4) == 0
```

But because of the order they are evaluated in, they are equivalent to:

[//]: # (elixir-formatter-disable-next-block)

```elixir
when rem(year, 400) == 0
when rem(year, 100) == 0 and not rem(year, 400) == 0
when rem(year, 4) == 0 and not rem(year, 100) == 0 and not rem(year, 400) == 0
```

The final clause, `def leap_year?(_), do: false`, returns false if previous clauses are not a match.

## Guards

The [guards][hexdocs-guards] are part of the pattern-matching mechanism.
They allow for more complex checks of values.
However, because of when they are executed to allow the compiler to perform necessary optimization,
only a minimal subset of operations is permitted.
`Kernel.rem/2` is on this limited list, and `Integer.mod/2` is not.
This is why, in this approach, only the first one will work, and the latter will not.

In this approach, the boolean operators matter too. Only the strict ones, `not`, `and`, `or` are allowed.
The relaxed `!`, `&&`, `||` will fail to compile.

[operators-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/operators
[hexdocs-guards]: https://hexdocs.pm/elixir/main/patterns-and-guards.html#guards
