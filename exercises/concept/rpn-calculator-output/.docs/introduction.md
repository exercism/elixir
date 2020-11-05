## try-rescue-else-after

Using `try..rescue` is a powerful construct for catching errors when they occur. Rescuing errors allows functions to return defined values when it is necessary. The `try..rescue` construct also offers us two additional features we can make use of:

- the `else` block
  - When the try block succeeds, the result is matched to this block.
- the `after` block
  - Whether the try block succeeds or raises, the code in the `after` block is always executed as long as the program is running at that point.
  - The result of the `after` block is not returned to the calling scope.

```elixir
try do
  :a
rescue
  _ -> :error
else
  :a -> :success
after
  :some_action
end
# => :success
```

## Dynamic dispatch

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
