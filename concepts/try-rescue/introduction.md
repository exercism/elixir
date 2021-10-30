# Introduction

Elixir provides a construct for rescuing from errors using `try .. rescue`

```elixir
try do                             #1
  raise RuntimeError, "error"      #2
rescue
  e in RuntimeError -> :error      #3
end
```

Let's examine this construct:

- **Line 1**, the block is declared with `try`.
- **Line 2**, the function call which may error is placed here, in this case we are calling `raise/2`.
- **Line 3**, in the `rescue` section, we pattern match on the _Module_ name of the error raised
  - on the left side of `->`:
    - `e` is matched to the error struct.
    - `in` is a keyword.
    - `RuntimeError` is the error that we want to rescue.
      - If we wanted to rescue from all errors, we could use `_` instead of the module name or omit the `in` keyword entirely.
  - on the right side:
    - the instructions to be executed if the error matches.

## Error structs

Errors (sometimes also called "exceptions") that you rescue this way are structs.
Rescuing errors in Elixir is done very rarely.
Usually the rescued error is logged or sent to an external monitoring service, and then reraised.
This means we usually don't care about the internal structure of the specific error struct.

In the [Exceptions concept](/tracks/elixir/concepts/exceptions) you will learn more about error structs, including how to define your own custom error.
