Elixir represents true and false values with the boolean type. There are only two values -- _true_ and _false_. These values can be bound to a variable:

```elixir
is_true = true
is_false = false
```

We can combine boolean values into expressions using boolean logical operators.  `and/2`, `or/2`, and `not/1` are commonly used in expressions to evaluate multiple boolean values to a single result.

```elixir
is_true = true and true
is_false = true and false

is_true = false or true
is_false = false or false

is_true = not false
is_false = not true
```

In Elixir, when a function returns a boolean value, it often has a `?` for a suffix:

```elixir
def either_true?(one, two) do
  one or two
end
```
