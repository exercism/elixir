## General

- Read the documentation:
  - [Elixir Getting Started - Errors][getting-started-errors]
  - [Elixir documentation - defexception][defexception]
  - [Elixir documentation - Exception Behaviour][exception-behaviour]
- Read the code snippets from the introduction

## 1. Error for Division by Zero

- implement the module, specifying the message using a special [built-in macro for defining exceptions][defexception]

## 2. Error when encountering stack underflow

- implement the module, specifying the message using a special [built-in macro for defining exceptions][defexception]
- You can use one of the Exception Behaviour callbacks to define an exception whose message changes based on the arguments passed to `raise/2`.

## 3. Write a dividing function

- write a multi-clause function using guards for control-flow
- you can pattern match in the function argument list to bind the stack's values to variables

[getting-started-errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[defexception]: https://hexdocs.pm/elixir/Kernel.html#defexception/1
[exception-behaviour]: https://hexdocs.pm/elixir/Exception.html
