## Ranges

[Ranges][range] represent a sequence of one or many consecutive integers. They:

- Are created using the [`..` special form][range-special-form] and can be both ascending and descending.
- Are always inclusive of the last value.
- Implement the [_Enumerable protocol_][enumerable].
- Are represented internally as a struct, but can be pattern matched using `..`.
- Can be used with integers written in the binary, octal, hexadecimal, and codepoint notation.

```elixir
Enum.map(?D..?A, & &1 + 3)
# => 'GFED'
```

## Pipe operator

The `|>` operator is called [the pipe operator][pipe]. It can be used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

```elixir
Enum.filter(Enum.map(1..5, fn n -> n * n end), fn n -> rem(n, 2) == 0 end)

# versus

1..5
|> Enum.map(fn n -> n * n end)
|> Enum.filter(fn n -> rem(n, 2) == 0 end)
```

It can also be used on a single line:

```elixir
"hello" |> String.split("") |> Enum.frequencies()
```

`Kernel` functions are usually used everywhere without the `Kernel` module name, but the module name needed when using those functions in a pipe chain. For example, `2 * 3 == 6` can also be written as:

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
  "hello" |> String.split("") |> Enum.frequencies()

  # don't
  String.split("hello", "") |> Enum.frequencies()
  ```

## Streams

The [`Stream` module][stream] is a _lazy_ alternative to the _eager_ [`Enum` module][enum]. Streams:

- Implement the [_Enumerable protocol_][enumerable].
- Are composable.
- Are internally represented as functions.
- Can be infinite.

Streams are ideal for dealing with slow resources and very large, potentially infinite, collections. For all other cases, use `Enum` instead.

[range-special-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#./2
[range]: https://hexdocs.pm/elixir/Range.html
[stream]: https://hexdocs.pm/elixir/Stream.html
[enum]: https://hexdocs.pm/elixir/Enum.html
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
[pipe]: https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2
