# Debugging

To help with debugging, you can use the fact that all console output will be captured and shown in the test results window. You can output any value by passing it to `IO.inspect`:

```elixir
"hello"
|> String.upcase()
|> IO.inspect()
```
