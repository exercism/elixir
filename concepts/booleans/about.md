Elixir represents true and false values with the boolean type. There are only two values: _true_ and _false_. These values can be bound to a variable and combined with boolean operators ([`and/2`][strict-and], [`or/2`][strict-or], [`not/1`][strict-not]):

```elixir
true_variable = true and true
false_variable = true and false

true_variable = false or true
false_variable = false or false

true_variable = not false
false_variable = not true
```

The operators [`and/2`][strict-and], [`or/2`][strict-or], and [`not/1`][strict-not] are strictly boolean which means they require their arguments to be booleans. There are also equivalent boolean operators which that any type of arguments - [`&&/2`][and], [`||/2`][or], and [`!/1`][not].

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
[strict-and]: https://hexdocs.pm/elixir/Kernel.html#and/2
[strict-not]: https://hexdocs.pm/elixir/Kernel.html#not/1
[strict-or]: https://hexdocs.pm/elixir/Kernel.html#or/2
[and]: https://hexdocs.pm/elixir/Kernel.html#&&/2
[not]: https://hexdocs.pm/elixir/Kernel.html#!/1
[or]: https://hexdocs.pm/elixir/Kernel.html#%7C%7C/2
