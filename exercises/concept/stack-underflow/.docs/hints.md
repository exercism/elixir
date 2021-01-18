## General

- Read about [errors][getting-started-errors] in the Getting Started guide.
- Read about [`defexception`][defexception] in the documentation.
- Read about the [`Exception` behaviour][exception-behaviour] in the documentation.
- Read the code snippets from the introduction.

## 1. Error for Division by Zero

- Implement the module, specifying the message using a special [built-in macro for defining exceptions][defexception].
- Modules can be nested inside of other modules.

## 2. Error when encountering stack underflow

- Implement the module, specifying the message using a special [built-in macro for defining exceptions][defexception].
- You can use one of the Exception Behaviour callbacks to define an exception whose message changes based on the arguments passed to `raise/2`.
- Modules can be nested inside of other modules.

## 3. Write a dividing function

- Write a multi-clause function using guards for control-flow.
- You can pattern match in the function argument list to bind the stack's values to variables.

[getting-started-errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[defexception]: https://hexdocs.pm/elixir/Kernel.html#defexception/1
[exception-behaviour]: https://hexdocs.pm/elixir/Exception.html
