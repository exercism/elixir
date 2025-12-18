# Pattern Matching

```elixir
defmodule Raindrops do
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case {rem(number, 3), rem(number, 5), rem(number, 7)} do
      {0, 0, 0} -> "PlingPlangPlong"
      {0, 0, _} -> "PlingPlang"
      {0, _, 0} -> "PlingPlong"
      {_, 0, 0} -> "PlangPlong"
      {0, _, _} -> "Pling"
      {_, 0, _} -> "Plang"
      {_, _, 0} -> "Plong"
      _ -> Integer.to_string(number)
    end
  end
end
```

## Case
The case allows us to evaluate if a number is divisible by 3, 5 and 7 once, and then match the results to various combinations of the possible outcomes.
The advantage of using a `case` on a tuple, like in the example above, is that the `rem` functions are executed only once.

## Cond
We can use `cond do`, too.
However, first, let's look at the maths to make the solution more compact.

A number is divisible by `a`, `b`, and `c` only when it is divisible by `a*b*c`.
So, instead of
```elixir
rem(number, 3) == 0 and rem(number, 5) == 0 and rem(number, 7) == 0
```
we can write
```elixir
rem(number, 3*5*7) == 0
```

Now, let's look at this pattern matching with `cond`.

```elixir
def convert(number) do
  cond do
    rem(number, 3*5*7) == 0 -> "PlingPlangPlong"
    rem(number, 3*5) == 0 -> "PlingPlang"
    rem(number, 3*7) == 0 -> "PlingPlong"
    rem(number, 5*7) == 0 -> "PlangPlong"
    rem(number, 3) == 0 -> "Pling"
    rem(number, 5) == 0 -> "Plang"
    rem(number, 7) == 0 -> "Plong"
    true -> Integer.to_string(number)
  end
end
```

## Multiple-clause functions
We can do something very similar by using guards in multi-clause functions.
We use different feautre of the language, but at its core, the approach is the same.

```elixir
defmodule Raindrops do
  @spec convert(pos_integer) :: String.t()
  def convert(number) when rem(number, 3*5*7) == 0, do: "PlingPlangPlong"
  def convert(number) when rem(number, 3*5) == 0, do: "PlingPlang"
  def convert(number) when rem(number, 3*7) == 0, do: "PlingPlong"
  def convert(number) when rem(number, 5*7) == 0, do: "PlangPlong"
  def convert(number) when rem(number, 3) == 0, do: "Pling"
  def convert(number) when rem(number, 5) == 0, do: "Plang"
  def convert(number) when rem(number, 7) == 0, do: "Plong"
  def convert(number), do: Integer.to_string(number)
end
```

We can use different features of the language, but at its core, the approach is the same.
We check a set of conditions that leads us to the exact answer.