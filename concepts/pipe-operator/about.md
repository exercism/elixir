# About

The `|>` operator is called [the pipe operator][pipe]. It can be used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

```elixir
String.replace_suffix(String.upcase(String.duplicate("go ", 3)), " ", "!")

# versus

"go "
|> String.duplicate(3)
|> String.upcase()
|> String.replace_suffix(" ", "!")
```

It can also be used on a single line:

```elixir
"go " |> String.duplicate(3) |> String.upcase() |> String.replace_suffix(" ", "!")
```

`Kernel` functions are usually used everywhere without the `Kernel` module name, but the module name is needed when using those functions in a pipe chain. For example, `2 * 3 == 6` can also be written as:

```elixir
2 |> Kernel.*(3) |> Kernel.==(6)
```

It is a matter of personal preference when to use the pipe operator and when not. Some Elixir developers like to follow those rules:

- Do not use the pipe operator when doing a single function call.

  ```elixir
  # do
  String.split("hello" , "")

  # don't
  "hello" |> String.split("")
  ```

- Do not create anonymous functions directly in the pipe chain.

  ```elixir
  # do
  take_n_letters = fn n -> Enum.take(?a..?z, n) end
  2 |> Kernel.*(3) |> take_n_letters.()

  # don't
  2 |> Kernel.*(3) |> (fn n -> Enum.take(?a..?z, n) end).()
  ```

- Always start a pipe chain with a variable or literal value, not a function call.

  ```elixir
  # do
  "hello" |> String.upcase() |> String.split("")

  # don't
  String.upcase("hello") |> String.split("")
  ```

[pipe]: https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2
