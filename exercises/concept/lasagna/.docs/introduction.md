# Introduction

## Basics

### Variables

Elixir is a dynamically-typed language, meaning that the type of a variable is only checked at runtime. Using the match `=` operator, we can bind a value of any type to a variable name:

```elixir
# Bound an integer value of 1
count = 1
# You may re-bind variables
count = 2

# You may re-bind any type to a variable
count = false

# Strings can be created by enclosing characters within double quotes
message = "Success!"
```

### Modules

Elixir is a [functional-programming language][functional-programming] and requires all named functions to be defined in a _module_. The `defmodule` keyword is used to define a module. All modules are available to all other modules at runtime and do not require an _access modifier_ to make them visible to other parts of the program. A _module_ is analogous to a _class_ in other programming languages.

```elixir
defmodule Calculator do
  # ...
end
```

### Named functions

_Named Functions_ must be defined in a module. The `def` keyword is used to define a _public_ named function.

Each function can have zero or more arguments. The value of the last expression in a function is always _implicitly returned_.

```elixir
defmodule Calculator do
  def add(x, y) do
    x + y
  end
end
```

Invoking a function is done by specifying its module and function name and passing arguments for each of the function's arguments.

```elixir
sum = Calculator.add(1, 2)
# => 3
```

The `defp` keyword can be used instead of `def` to define a _private_ function. Private functions can only be used from within the same module that defined them.

When invoking a function inside the same module where it's defined, the module name can be omitted.

You may also write short functions using a one-line syntax (note the comma `,` and the colon `:` around the keyword `do`).

```elixir
defmodule Calculator do
  def subtract(x, y) do
    private_subtract(x, y)
  end

  defp private_subtract(x, y), do: x - y
end

difference = Calculator.subtract(7, 2)
# => 5

difference = Calculator.private_subtract(7, 2)
# => ** (UndefinedFunctionError) function Calculator.private_subtract/2 is undefined or private
#       Calculator.private_subtract(7, 2)
```

### Arity of functions

It is common to refer to functions with their _arity_. The _arity_ of a function is the number of arguments it accepts.

```elixir
# add/3 because this function has three arguments, thus an arity of 3
def add(x, y, z) do
  x + y + z
end
```

### Naming conventions

Module names should use `PascalCase`. A module name must start with an uppercase letter `A-Z` and can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`.

Variable and function names should use `snake_case`. A variable or function name must start with a lowercase letter `a-z` or an underscore `_`, can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`, and might end with a question mark `?` or an exclamation mark `!`.

### Standard library

Elixir has a very rich and well-documented standard library. The documentation is available online at [hexdocs.pm/elixir][docs]. Save this link somewhere - you will use it a lot!

Most built-in data types have a corresponding module that offers functions for working with that data type, e.g. there's the `Integer` module for integers, `String` module for strings, `List` module for lists and so on.

A notable module is the `Kernel` module. It provides the basic capabilities on top of which the rest of the standard library is built, like arithmetic operators, control-flow macros, and much more. Functions for the `Kernel` module are automatically imported, so you can use them without the `Kernel.` prefix.

### Code comments

Comments can be used to leave notes for other developers reading the source code. Single line comments in Elixir are preceded by `#`.

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
[docs]: https://hexdocs.pm/elixir/Kernel.html#content
