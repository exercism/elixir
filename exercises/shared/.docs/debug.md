# Debugging

To help with debugging, you can use the fact that all console output will be captured and shown in the test results window. You can output any value by passing it to `IO.inspect`.

`IO.inspect` returns the value unchanged, which makes it especially useful for inspecting intermediate values in function call chains.

```elixir
"hello"
|> String.upcase()
|> IO.inspect()
|> String.split("", trim: true)
```

Note that for security reasons, the output for each test will get truncated after 500 characters.
