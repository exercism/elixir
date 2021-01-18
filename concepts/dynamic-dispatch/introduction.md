When Elixir resolves the function to be invoked, it uses the Module's name to perform a lookup. The lookup can be done dynamically if the Module's name is bound to a variable.

```elixir
defmodule MyModule do
  def message(), do: "My message"
end

atom = MyModule
atom.message()
# => "My message"
```

Internally, a Module's name is an atom. All Elixir module atoms are automatically prefixed with `Elixir.`

```elixir
is_atom(Enum)
# => true
Enum == Elixir.Enum
# => true
```
