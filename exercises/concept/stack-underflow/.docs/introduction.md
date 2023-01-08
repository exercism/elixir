# Introduction

## Exceptions

All errors in Elixir implement the _Exception Behaviour_. Just like the _Access Behaviour_, the _Exception Behaviour_ defines callback functions that a module must implement to fulfill the software contract of the behaviour. Once an error is defined, it has the following properties:

- The module's name defines the error's name.
- The module defines an error-struct.
- The struct will have a `:message` field.
- The module can be used with `raise/1` and `raise/2` to raise the intended error

The _Exception Behaviour_ also specifies two callbacks: `message/1` and `exception/1`. If unimplemented, default implementations will be used. `message/1` transforms the error-struct to a readable message when called with `raise`. `exception/1` allows additional context to be added to the message when it is called with `raise/2`

### Defining an exception

To define an exception from an error module, we use the `defexception` macro:

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

### Using exceptions

Defined errors may be used like a built in error using either `raise/1` or `raise/2`.

- `raise/1` raises a specific error by its module name, or, if the argument is a string, it will raise a `RuntimeError` with the string as the message.
- `raise/2` raises a specific error by its module name, and accepts an attributes argument which is used to obtain the error with the appropriate message.
