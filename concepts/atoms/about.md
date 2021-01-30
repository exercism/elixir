You can use [atoms][atom] whenever you have a set of constants to express. Atoms provide a type-safe way to compare values. An atom is defined by its name, prefixed by a colon:

```elixir
# Atoms start with a ':',
# followed by alphanumeric snake_cased characters
:an_atom
```

Many functions in Elixir's standard library return an atom to annotate the result:

```elixir
Enum.fetch([1], 0)
# => {:ok, 1}
Enum.fetch([1], 2)
# => :error
```

[_Atoms_][atom] are internally represented by an integer in a lookup table, which are set automatically. That makes comparing atoms faster than comparing strings. It is not possible to change this internal value. It is generally considered to be an [anti-pattern][anti-pattern] to dynamically create atoms from user supplied input. The runtime only has space for a limited number of atoms, generating new atoms at runtime could fail if the atom table is full.

[atom]: https://elixir-lang.org/getting-started/basic-types.html#atoms
[anti-pattern]: https://en.wikipedia.org/wiki/Anti-pattern
