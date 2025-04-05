# Step By Step

```elixir
defmodule Raindrops do
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    pling = if rem(number, 3) == 0, do: "Pling", else: ""
    plang = if rem(number, 5) == 0, do: "Plang", else: ""
    plong = if rem(number, 7) == 0, do: "Plong", else: ""
    sound = pling <> plang <> plong

    if sound == "" do
      Integer.to_string(number)
    else
      sound
    end
  end
end
```

In this approach, we test each condition only once, similar to using the `case` on a tuple in the [pattern matching approach][pattern-matching-approach].
However, this time, if a condition is true, we capture the sound component, and if it is not true, we capture the sound as an empty string.

Once this is done, we can concatenate all three conditions to get the full sound.
Finally, if the `sound` is empty, we can return the number or, alternatively, the calculated `sound`.

## Functions

We can create private functions to test for component sounds.

```elixir
defp pling(n) when rem(n, 3) == 0, do: "Pling"
defp pling(_), do: ""
defp plang(n) when rem(n, 5) == 0, do: "Plang"
defp plang(_), do: ""
defp plong(n) when rem(n, 7) == 0, do: "Plong"
defp plong(_), do: ""
defp sound(sound, number) when sound == "", do: Integer.to_string(number)
defp sound(sound, _number), do: sound
```

Now the solution can look like this:
```elixir
def convert(number) do
  sound(pling(number) <> plang(number) <> plong(number), number)
end
```

## The pipe operator

With a slightly different design of the functions we can use the pipe operator to have a very clean-looking code

```elixir
@spec convert(pos_integer) :: String.t()
def convert(number) do
  {"", number}
  |> pling
  |> plang
  |> plong
  |> sound
end
```
At least in the `convert` functions. The `pling`, `plang`, `plong` become a bit more complex:
```elixir
defp pling({ s, n }) when rem(n, 3) == 0, do: { s <> "Pling", n }
defp pling({ s, n }), do: { s, n }
defp plang({ s, n }) when rem(n, 5) == 0, do: { s <> "Plang", n }
defp plang({ s, n }), do: { s, n }
defp plong({ s, n }) when rem(n, 7) == 0, do: { s <> "Plong", n }
defp plong({ s, n }), do: { s, n }
defp sound({ s, n }) when s == "" , do: n |> Integer.to_string
defp sound({ s, _ }), do: s
```

All the examples above, at their core, represent the same approach of doing the check step by step.

[pattern-matching-approach]: https://exercism.org/tracks/elixir/exercises/raindrops/approaches/pattern-matching