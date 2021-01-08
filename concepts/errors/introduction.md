Errors happen. In Elixir, while people often say to "let it crash", there are times when we need to rescue the function call to a known good state to fulfil a software contract. In some languages, errors are used as method of control flow, but in Elixir, this pattern is discouraged. We can often recognize functions that may raise an error just by their name: functions that raise errors are to have `!` at the end of their name. This is in comparison with functions that return `{:ok, value}` or `:error`. Look at these library examples:

```elixir
Map.fetch(%{a: 1}, :b)
# => :error
Map.fetch!(%{a: 1}, :b)
# => raises KeyError
```
