## General

- Review the official documentation
  - [Elixir - Getting Started: Errors][errors]
  - [Elixir - try][docs-try]

## 1. Warn the team

- Allow the operation function to raise its error.
- To invoke a function in a variable, use the `.` operator.

```elixir
my_function = fn -> :ok end
my_function.()
# => :ok
```

## 2. Wrap the error

- Make use of try .. rescue to return the intended result

## 3. Pass on the message

- Make use of try .. rescue to return the intended result
- The rescue block allows you to pattern match on the error's Module name and also bind the error to a variable.

[errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[docs-try]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#try/1
