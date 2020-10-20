While Elixir programmers often say ["let it crash"][let-it-crash] and code for the ["happy path"][happy-path], there are often times we need to rescue the function call to return a specific value, message or release system resources.

- Functions that raise errors under normal circumstances should have `!` at the end of their name.
- Functions may alternatively return atoms and tuples to indicate success and failure:

  ```elixir
  Map.fetch(%{a: 1}, :a)
  # => {:ok, 1}
  Map.fetch(%{a: 1}, :b)
  # => :error

  Map.fetch!(%{a: 1}, :b)
  # => raises KeyError
  ```

## Avoid anti-patterns

Avoid programming patterns that use errors to control logical flow. This is an anti-pattern in Elixir.

```elixir
# Avoid using errors for control-flow.
try do
  {:ok, value} = MyModule.janky_function()
  "All good! #{value}."
rescue
  e in RuntimeError ->
    reason = e.message
    "Uh oh! #{reason}."
end

# Rather, use control-flow structures for control-flow.
case MyModule.janky_function() do
  {:ok, value} -> "All good! #{value}."
  {:error, reason} -> "Uh oh! #{reason}."
end
```

[getting-started]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html
[errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[let-it-crash]: https://www.amberbit.com/blog/2019/7/26/the-misunderstanding-of-let-it-crash/
[happy-path]: https://en.wikipedia.org/wiki/Happy_path
