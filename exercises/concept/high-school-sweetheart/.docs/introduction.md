# Introduction

## Strings

Strings in Elixir are delimited by double quotes, and they are encoded in UTF-8:

```elixir
"Hi!"
```

Strings can be concatenated using the `<>/2` operator:

```elixir
"Welcome to" <> " " <> "New York"
# => "Welcome to New York"
```

Strings in Elixir support interpolation using the `#{}` syntax:

```elixir
"6 * 7 = #{6 * 7}"
# => "6 * 7 = 42"
```

To put a newline character in a string, use the `\n` escape code:

```elixir
"1\n2\n3\n"
```

To comfortably work with texts with a lot of newlines, use the triple-double-quote heredoc syntax instead:

```elixir
"""
1
2
3
"""
```

Elixir provides many functions for working with strings in the `String` module.

## Pipe Operator

The `|>` operator is called the pipe operator. It is used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

It is important to use the pipe operator with prudence and adhere to best practices. Avoid using the pipe operator when performing a single function call, as it can lead to unnecessary complexity. In such cases, it is recommended to call the function directly with its arguments.

For example:

```elixir
String.split("hello", "")
```

When using the pipeline, you can place the `|>` operator after the result of a function call to pass its return value as the first argument to the next function. However, there is no need to use the `|>` operator on the first function call, as you can simply call the function with its arguments.

Here's an example:

```elixir
"hello"
|> String.upcase()
|> Kernel.<>("?!")
# => "HELLO?!"
```

In this example, we "pipe" the string `"hello"` into the `String.upcase` function, and the resulting string is piped into `Kernel.<>` as the first argument.
