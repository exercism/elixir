## Errors - Key points

- Rescuing errors allows functions to return defined values when it is appropriate
- There are 4 parts to a `try-rescue` construct:
  - The `try` block:
    - Where the code that may raise an error is invoked
  - The `rescue` block:
    - Where a pattern match on the error allows the function to return a different result, or raise another error.
  - The `else` block:
    - Where a pattern match on the successful result from the try-block occurs
  - The `after` block:
    - Where functions are invoked whether the try-block succeeds or is rescued as long as the program is running.
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

- All module names are a special form of atom

  - All elixir module atoms are automatically prefixed with `Elixir.` when compiled.

  ```elixir
  is_atom(Enum)
  # => true
  Enum == Elixir.Enum
  # => true
  ```

- Elixir can resolve a functions to be invoked at run-time, using the Module's name to perform a lookup.
- The lookup can be done dynamically if the Module's name is bound to a variable.

```elixir
defmodule MyModule do
  def message(), do: "My message"
end

atom = MyModule
atom.message()
# => "My message"
```
