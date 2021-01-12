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
