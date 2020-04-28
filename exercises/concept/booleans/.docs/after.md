Elixir represents true and false values with the boolean type. There are only two values: _true_ and _false_. These values can be bound to a variable and combined with boolean operators (`and/2`, `or/2`, `not/1`):

```elixir
true_variable = true and true
false_variable = true and false

true_variable = false or true
false_variable = false or false

true_variable = not false
false_variable = not true
```

Boolean operators use _short-circuit evaluation_, which means that expression on the right-hand side of the operator is only evaluated if needed.

Each of the operators has a different precedence, where `not/1` is evaluated before `and/2` and `or/2`. Brackets can be used to evaluate one part of the expression before the others:

```elixir
not true and false # => false
not (true and false) # => true
```

When writing a function that returns a boolean value, it is [idiomatic to end the function name][naming] with a `?`.

```elixir
def either_true?(a, b) do
  a or b
end
```

[naming]: https://hexdocs.pm/elixir/naming-conventions.html#trailing-question-mark-foo
