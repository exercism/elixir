Elixir's `atom` type represents a fixed constant. An atom's value is simply its own name. This gives us a type-safe way to interact with data. Atoms can be defined as follows:

```elixir
# All atoms are preceded with a ':' then follow with alphanumeric snake-cased characters
variable = :an_atom
```

_Atoms_ are internally represented by an integer in a lookup table, which are set automatically. It is not possible to change this internal value.
