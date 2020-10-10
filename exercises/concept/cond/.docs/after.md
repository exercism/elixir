You can use [atoms][atom] whenever you have a set of constants you want to express. Using [atoms][atom] opens a type-safe way of interacting with constant values. An atom is defined by its name, following the [atom][atom] format:

```elixir
# All atoms are preceded with a ':' then follow with alphanumeric snake-cased characters
variable = :an_atom
```

[_Atoms_][atom] are internally represented by an integer in a lookup table, which are set automatically. It is not possible to change this internal value. It is generally considered to be an [anti-pattern][anti-pattern] to dynamically create atoms from user supplied input.

[_Atoms_][atom] are also often used to represent finite states. Many functions in Elixir's standard library return an atom to annotate the result:

```elixir
Enum.fetch([1], 0)
# => {:ok, 1}
Enum.fetch([1], 2)
# => :error
```

When we want to have branching code, we can use the `cond/1` function:

```elixir
cond do
  sometimes -> :this_might_be_the_way
  other_times -> :or_that_might_be_the_way
  true -> :this_is_the_default_way
end
```

At least one clause should evaluate to `true` or a run-time error will be raised.

The `cond` conditional is usually used when there are more than two logical branches, and each branch has a condition based on different variables. If all the conditions are based on the same variables, a `case` conditional is a better fit. If there are only two logical branches, use an `if` conditional instead.

[atom]: https://elixir-lang.org/getting-started/basic-types.html#atoms
[anti-pattern]: https://en.wikipedia.org/wiki/Anti-pattern
