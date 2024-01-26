# Introduction

## Pattern matching

The output of the `convert` method depends on three conditions.
We can be very explicit with the solution and match all the possible patterns.

```elixir
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
```

We can use a few Elixir features to do more or less the same and we explore them in the [pattern matching approach][pattern-matching-approach].

[pattern-matching-approach]: https://exercism.org/tracks/elixir/exercises/raindrops/approaches/pattern-matching