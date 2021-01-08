Often, we want to write code that can branch based on a condition. While there are many ways to do this in Elixir, one of the simplest ways is using a `cond/1` function as a control flow structure.

At its simplest, a `cond` structure follows the first path that evaluates to _true_ with one or more branches:

```elixir
cond do
  sometimes -> :this_might_be_the_way
  true -> :this_is_the_default_way
end
```

If no path evaluates to _true_, an error is raised by the runtime.
