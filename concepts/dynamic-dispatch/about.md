Functions in Elixir can be dispatched dynamically.

All module names are atoms. All Elixir module names are automatically prefixed with `Elixir.` when compiled.

```elixir
is_atom(Enum)
# => true
Enum == Elixir.Enum
# => true
```

Elixir can resolve a function to be invoked at run-time, using the Module's name to perform a lookup. The lookup can be done dynamically if the Module's name is bound to a variable.

```elixir
defmodule MyModule do
  def message(), do: "My message"
end

atom = MyModule
atom.message()
# => "My message"
```
