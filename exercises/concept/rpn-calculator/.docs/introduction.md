# Introduction

## Errors

Errors happen. In Elixir, while people often say to "let it crash", there are times when we need to rescue the function call to a known good state to fulfill a software contract. In some languages, errors are used as a method of control flow, but in Elixir, this pattern is discouraged. We can often recognize functions that may raise an error just by their name: functions that raise errors are to have `!` at the end of their name. This is in comparison with functions that return `{:ok, value}` or `:error`. Look at these library examples:

```elixir
Map.fetch(%{a: 1}, :b)
# => :error
Map.fetch!(%{a: 1}, :b)
# => raises KeyError
```

## Try/Rescue

Elixir provides a construct for rescuing from errors using `try .. rescue`

```elixir
try do
  raise RuntimeError, "error"
rescue
  e in RuntimeError -> :error
end
```

Let's examine this construct:

- **Line 1**, the block is declared with `try`.
- **Line 2**, the function call which may error is placed here, in this case we are calling `raise/2`.
- **Line 4**, in the `rescue` section, we pattern match on the _Module_ name of the error raised
  - on the left side of `->`:
    - `e` is matched to the error struct.
    - `in` is a keyword.
    - `RuntimeError` is the error that we want to rescue.
      - If we wanted to rescue from all errors, we could use `_` instead of the module name or omit the `in` keyword entirely.
  - on the right side:
    - the instructions to be executed if the error matches.

### Error structs

Errors (sometimes also called "exceptions") that you rescue this way are structs.
Rescuing errors in Elixir is done very rarely.
Usually the rescued error is logged or sent to an external monitoring service, and then reraised.
This means we usually don't care about the internal structure of the specific error struct.

In the [Exceptions concept][exercism-exceptions] you will learn more about error structs, including how to define your own custom error.

[exercism-exceptions]: https://exercism.org/tracks/elixir/concepts/exceptions
