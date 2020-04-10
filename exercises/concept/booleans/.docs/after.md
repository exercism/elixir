Elixir represents true and false values with the boolean type. There are only two values -- _true_ and _false_. These values can be bound to a variable and combined with boolean operators (`and/2`, `or/2`, `not/1`):

```elixir
is_true = true and true
is_false = true and false

is_true = false or true
is_false = false or false

is_true = not false
is_false = not true
```

Boolean operators use _short-circuit evaluation_, which means that right-hand side of the operator is only evaluated with needed.

Each of the operators has a different precendence, where `not/1` is evaluated before `and/2`, `or/2`.

```elixir
not true and false # => false
not (true and false) # => true
```

In Elixir, when a function returns a boolean value, it often has a [`?` for a suffix][naming]:

```elixir
def either_true?(one, two) do
  one or two
end
```

[naming]: https://hexdocs.pm/elixir/master/naming-conventions.html#trailing-question-mark-foo
