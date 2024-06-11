# Boolean operators

```elixir
defmodule Year do
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    (rem(year, 4) == 0 and not rem(year, 100) == 0) or rem(year, 400) == 0
  end
end
```

## Short-circuiting

At the core of this approach, three checks are returning three boolean values.
We can use [Boolean logic](https://en.wikipedia.org/wiki/Boolean_algebra) to combine the results.

When using this approach, it is essential to consider short-circuiting of boolean operators.
The expression `left and right` can be only true if both `left` and `right` are *true*.
If `left` is *false*, `right` will not be evaluated. The result will be *false*.
However, if `left` is *true*, `right` has to be evaluated to determin the outcome.

The expression `left or right` can be true if either `left` or `right` is *true*.
If `left` is *true*, `right` will not be evaluated. The result will be *true*.
However, if `left` is *false*, `right` has to be evaluated to determine the outcome.

## Precedence of operators

[//]: # (elixir-formatter-disable-next-block)

Another thing to consider when using Boolean operators is their precedence.
```elixir
true or false and false
```
The above evaluates to *true* because in Elixir `and` has higher precedence than `or`.
The above expression is equivalent to:
```elixir
true or (false and false)
```
If `or` should be evaluated first, we must use parenthesis.
```elixir
(true or false) and false
```
which equals to *false*.

The `not` operator is evaluated before `and` and `or`.

## Strict or relaxed?

Elixir offers two sets of Boolean operators: strict and relaxed.
The strict versions `not`, `and`, `or` require the first (left) argument to be of [boolean type][hexdocs-booleans].
The relaxed versions `!`, `&&`, `||` require the first argument to be only [truthy or falsy][hexdocs-truthy].

In the case of this exercise, both types will work equally well, so the solution could be:
```elixir
def leap_year?(year) do
  (rem(year, 4) == 0 && !(rem(year, 100) == 0)) || rem(year, 400) == 0
end
```

## Being explicit

The `leap_year?` function could be written like so:
```elixir
def leap_year?(year) do
  (rem(year, 4) == 0 and not rem(year, 100) == 0) or rem(year, 400) == 0
end
```

Some prefer this form, as it is very direct. We can see what is happening.
We are explicitly checking the reminder, comparing it to zero.

```elixir
defp divides?(number, divisor), do: rem(number, divisor) == 0

def leap_year?(year) do
  (divides?(year, 4) and not divides?(year, 100)) or divides?(year, 400)
end
```

Others might prefer the above form, which requires defining the `devides?` function or something similar.
By doing so, we can be explicit about the *intent*.
We want to check if a year can be equally divided into a number.

Yet another approach might be to use variables to capture the results of individual checks and provide the extra meaning.
This approach also shortens the check so the Boolean operators and relationships between them are more prominent.

```elixir
def leap_year?(year) do
  by4? = divides?(year, 4)
  by100? = divides?(year, 100)
  by400? = divides?(year, 400)
  (by4? and not by100?) or by400?
end
```

All versions of the code will work. Which one to choose is often a personal or sometimes a team preference. What reads best for you? What will make most sense to you when you look at the code again?

[hexdocs-booleans]: https://hexdocs.pm/elixir/basic-types.html#booleans-and-nil
[hexdocs-truthy]: https://hexdocs.pm/elixir/Kernel.html#module-truthy-and-falsy-values
[exercism-booleans]: https://exercism.org/tracks/elixir/concepts/booleans
