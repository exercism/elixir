The `|>` operator is called the pipe operator. It can be used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

```elixir
1..5
|> Enum.map(fn n -> n * n end)
|> Enum.filter(fn n -> rem(n, 2) == 0 end)
# => [4, 16]
```
