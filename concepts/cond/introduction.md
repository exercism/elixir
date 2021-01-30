Often, we want to write code that can branch based on a condition. While there are many ways to do this in Elixir, one of the simplest ways is using `cond/1`.

At its simplest, `cond` follows the first path that evaluates to `true` with one or more branches:

```elixir
cond do
  x > 10 -> :this_might_be_the_way
  y < 7 -> :or_that_might_be_the_way
  true -> :this_is_the_default_way
end
```

If no path evaluates to `true`, an error is raised by the runtime.
