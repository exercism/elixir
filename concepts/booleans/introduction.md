Elixir represents true and false values with the boolean type. There are only two values: `true` and `false`.

```elixir
true_variable = true
false_variable = false
```

We can evaluate strict boolean expressions using the `and/2`, `or/2`, and `not/1` operators.

```elixir
true_variable = true and true
false_variable = true and false

true_variable = false or true
false_variable = false or false

true_variable = not false
false_variable = not true
```

When writing a function that returns a boolean value, it is idiomatic to end the function name with a `?`.

```elixir
def either_true?(a, b) do
  a or b
end
```
