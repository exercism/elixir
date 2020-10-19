The [_Exception Behaviour_][exception-behaviour] defines how [`errors`][getting-started-errors] are raised and displayed.

It includes two optional callbacks:

- `message/1` transforms the error-struct into a readable message.
- `exception/1` creates the message from the 2nd argument in `raise/2` allowing the message to be modified.

Defined errors:

- Share the name of the module they are implemented in.
- Are an extension of the struct-type.
- Have a `:message` field.
- Can be be used with `raise/1` and `raise/2` to raise the intended error

## Defining an exception

To define an exception from an error module, use the [`defexception`][defexception] macro function:

```elixir
# Defines a minimal error, with the name `MyError`
defmodule MyError do
  defexception message: "error"
end

# Defines an error with a customized exception/1 function
defmodule MyCustomizedError do
  defexception message: "custom error"

  @impl true
  def exception(value) do
    case value do
      [] ->
        %MyCustomizedError{}
      _ ->
        %MyCustomizedError{message: "Alert: " <> value}
    end
  end
end
```

## Using exceptions

Defined errors may be used like a built in error using either `raise/1` or `raise/2`:

```elixir
raise MyError
# => ** (MyError) error

raise MyError, "an error occurred"
# => ** (MyError) an error occurred

raise MyCustomizedError
# => ** (MyCustomizedError) "custom error"

raise MyCustomizedError, "a very bad error occurred"
# => ** (MyCustomizedError) Alert: a very bad error occurred
```

[getting-started-errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[defexception]: https://hexdocs.pm/elixir/Kernel.html#defexception/1
[exception-behaviour]: https://hexdocs.pm/elixir/Exception.html
