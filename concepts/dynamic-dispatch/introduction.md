When Elixir resolves the function to be invoked, it uses the Module's name (atom) to perform a lookup. The lookup can be done dynamically if the Module's name (atom) is bound to a variable.

- You are familiar with the atom type:

```elixir
is_atom(:an_atom)
# => true
```

- A Module's name is also an atom.
  - All elixir module atoms are automatically prefixed with `Elixir.`

```elixir
is_atom(Enum)
# => true
Enum == Elixir.Enum
# => true
```

- we can call a function from the module referenced by the atom:

```elixir
defmodule MyModule do
  def message(), do: "My message"
end

atom = MyModule
atom.message()
# => "My message"
```
