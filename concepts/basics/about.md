# About

- Elixir is dynamically-typed.
  - The type of a variable is only checked at run-time.
- Using the match [`=`][match] operator, we can bind a value of any type to a variable name:
  - It is possible to re-bind variables.
  - A variable may have any type of value bound to it.

## Modules

- [Modules][modules] are the basis of code organization in Elixir.
  - A module is visible to all other modules.
  - A module is defined with [`defmodule`][defmodule].

## Named Functions

- All [named functions][functions] must be defined in a module.

  - Named functions are defined with [`def`][def].
  - A named function may be made private by using [`defp`][defp] instead.
  - The value of the last expression in a function is _implicitly returned_.
  - Short functions may also be written using a one-line syntax.

  ```elixir
  def increment(n) do
    n + 1
  end

  defp private_increment(n) do
    n + 1
  end

  def short_increment(n), do: n + 1
  ```

- Functions are invoked using the full name of the function with the module name.
  - If invoked from within its own module, the module name may be omitted.
- The arity of a function is often used when referring to a named function.

  - The arity refers to the number of arguments it accepts.

  ```elixir
  # add/3, because the arity is 3
  def add(x, y, z), do: x + y + z
  ```

## Naming conventions

Module names should use `PascalCase`. A module name must start with an uppercase letter `A-Z` and can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`.

Variable and function names should use `snake_case`. A variable or function name must start with a lowercase letter `a-z` or an underscore `_`, can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`, and might end with a question mark `?` or an exclamation mark `!`.

## Integers

Integer values are whole numbers written with one or more digits. You can perform [basic mathematical operations][operators] on them.

## Strings

[String][string] literals are sequences of characters surrounded by double quotes.

```elixir
string = "this is a string! 1, 2, 3!"
```

## Standard library

- The documentation is available online at [hexdocs.pm/elixir][docs].
- Most built-in data types have a corresponding module, e.g. `Integer`, `Float`, `String`, `Tuple`, `List`.
- The `Kernel` module is a special module.
  - Provides the basic capabilities on top of which the rest of the standard library is built.
  - Automatically imported.
  - Its functions can be used without the `Kernel.` prefix.

## Code comments

Comments can be used to leave notes for other developers reading the source code. Single line comments in Elixir are preceded by `#`.

[match]: https://elixirschool.com/en/lessons/basics/pattern_matching/
[operators]: https://hexdocs.pm/elixir/basic-types.html#basic-arithmetic
[modules]: https://elixirschool.com/en/lessons/basics/modules/#modules
[functions]: https://elixirschool.com/en/lessons/basics/functions/#named-functions
[def]: https://hexdocs.pm/elixir/Kernel.html#def/2
[defp]: https://hexdocs.pm/elixir/Kernel.html#defp/2
[defmodule]: https://hexdocs.pm/elixir/Kernel.html#defmodule/2
[string]: https://hexdocs.pm/elixir/basic-types.html#strings
[docs]: https://hexdocs.pm/elixir/Kernel.html#content
