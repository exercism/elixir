## General

- Review the official documentation:
  - [Elixir Getting Started - Errors][getting-started-errors]
  - [Elixir Getting Started - IO][getting-started-io]

## 1. Open a file

- Use _dynamic dispatch_ to use invoke the open function.
  - Review the introduction code snippet

## 2. Attempt to write to the file

- Make use of the try-rescue construct
- There is [function][io-write] in the `IO` module that allows you to write to an `io handler`
- You can use the `rescue` block to pattern match on the error and return the error tuple
- You can use the `else` block to pattern match on the return of a successful write.

## 3. Close the file

- You can use the `after` block to carry out a function whether a `try` block succeeds or is rescued.

[getting-started-errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html
[getting-started-io]: https://elixir-lang.org/getting-started/io-and-the-file-system.html
[io-write]: https://hexdocs.pm/elixir/IO.html#write/2
