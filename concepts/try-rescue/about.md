# About

[`try .. rescue`][docs-try] can be used to capture and evaluate [errors][errors] that are raised inside a block.

For example:

```elixir
try do                             #1
  raise RuntimeError, "error"      #2
rescue
  e in RuntimeError -> :error      #3
end
```

- **Line 1**, the block is declared with `try`.
- **Line 2**, the function call which may generate an error is placed here, in this case we are calling `raise/1`.
- **Line 3**, in the `rescue` section, we pattern match on the _Module_ name of the error raised
  - on the left side of `->`:
    - `e` is matched to the error struct.
    - `in` is a keyword.
    - `RuntimeError` is the module to matched, but can match on any error module, or `_` all errors.
  - on the right side:
    - the instructions to be executed if the error matches.

## Error structs

Errors (sometimes also called "exceptions") that you rescue this way are structs.
Different error structs have different keys.
Under the ["exceptions" section][argument-error] in the standard library you can find a list of all predefined errors.

```elixir
# ArithmeticError caused by division by zero
%ArithmeticError{message: "bad argument in arithmetic expression"}

# Protocol.UndefinedError caused by passing `nil` to `Enum.count/1`
%Protocol.UndefinedError{description: "", protocol: Enumerable, value: nil}
```

Rescuing errors in Elixir is done very rarely.
Usually the rescued error is logged or sent to an external monitoring service, and then reraised.
This means we usually don't care about the internal structure of the specific error struct.

The [Exceptions concept]( /tracks/elixir/concepts/exceptions) describes how to define custom error structs.

## Avoid anti-patterns

- Avoid programming patterns that use errors to control logical flow. This is an anti-pattern in Elixir.

  ```elixir
  # Avoid using errors for control-flow.
  try do
    {:ok, value} = MyModule.janky_function()
    "All good! #{value}."
  rescue
    e in RuntimeError ->
      reason = e.message
      "Uh oh! #{reason}."
  end

  # Rather, use control-flow structures for control-flow.
  case MyModule.janky_function() do
    {:ok, value} -> "All good! #{value}."
    {:error, reason} -> "Uh oh! #{reason}."
  end
  ```

## To raise, or not to raise, that is the question

As it's written in [Elixir's getting started guide][getting-started]:

> It’s up to your application to decide if an error while [performing an action] is exceptional or not. That’s why Elixir doesn’t impose exceptions on [...] functions. Instead, it leaves it up to the developer to choose the best way to proceed.

[getting-started]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html
[errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[docs-try]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#try/1
[argument-error]: https://hexdocs.pm/elixir/ArgumentError.html#content
