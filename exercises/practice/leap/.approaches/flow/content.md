# Control flow structures

```elixir
defmodule Year do
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    if rem(year, 100) == 0 do
      rem(year, 400) == 0
    else
      rem(year, 4) == 0
    end
  end
end
```

## If

Elixir provides four [control flow structures][hexdocs-structures]: `case`, `cond`, `if`, and `unless`.

The `if` and `unless` allow to evaluate only one condition.
Unlike in many other languages, there is no `else if` option in Elixir.

However, in this case, it is not necessary. We can use `if` once to check if the year is divisible by 100.
If it is, then whether it is a leap year or not depends on if it is divisible by 400.
If it is not, then whether it is a leap year or not depends on if it is divisible by 4.

```elixir
def leap_year?(year) do
  if rem(year, 100) == 0 do
    rem(year, 400) == 0
  else
    rem(year, 4) == 0
  end
end
```

## Cond

Another option is `cond` which allows for evaluating multiple conditions, similar to `else if` in other languages.

```elixir
def leap_year?(year) do
  cond do
    rem(year, 400) == 0 -> true
    rem(year, 100) == 0 -> false
    rem(year, 4) == 0 -> true
    true -> false
  end
end
```

Similarly to the [multiple clause function approach][clause-approach], the order here matters.
The conditions are evaluated in order, and the first that is not `nil` or `false` leads to the result.

## Case

`case` allows to compare a value to multiple patterns, but can also replicate what `if` offers.

```elixir
def leap_year?(year) do
  case rem(year, 100) do
    0 -> rem(year, 400) == 0
    _ -> rem(year, 4) == 0
  end
end
```

It also supports [guards][hexdocs-guards], offering another way to solve the problem.

```elixir
def leap_year?(year) do
  case year do
    _ when rem(year, 400) == 0 -> true
    _ when rem(year, 100) == 0 -> false
    _ when rem(year, 4) == 0 -> true
    _ -> false
  end
end
```

The `case` can be very flexible, so many variations are possible.
Using it with pattern matching on a tuple is considered **the most idiomatic**.
In this case, a tuple is created with all the checks.
Then, pattern matching to tuples is performed.

```elixir
def leap_year?(year) do
  case {rem(year, 400), rem(year, 100), rem(year, 4)} do
    {0, _, _} -> true
    {_, 0, _} -> false
    {_, _, 0} -> true
    _ -> false
  end
end
```

[hexdocs-structures]: https://hexdocs.pm/elixir/case-cond-and-if.html
[hexdocs-guards]: https://hexdocs.pm/elixir/main/patterns-and-guards.html#guards
[clause-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/clauses
