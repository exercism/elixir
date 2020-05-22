Elixir is a dynamically-typed language, meaning that the type of a variable is only checked at runtime. Using the match `=` operator, we can bind a value of any type to a variable name:

```elixir
count = 1 # Bound an integer value of 1
count = 2 # You may re-bind variables

count = false # You may re-bind any type to a variable
```

## Modules

Elixir is an [functional-programming language][functional-programming] and requires all named functions to be defined in a _module_. The `defmodule` keyword is used to define a module. All modules are available to all other modules at runtime and do not require an _access modifier_ to make them visible to other parts of the program. A _module_ is analogous to a _class_ in other programming languages.

```elixir
defmodule Calculator do
  # ...
end
```

## Named Functions

_Named Functions_ must be defined in a module. Each function can have zero or more parameters. All parameters are dynamically-typed, and the return type is not explicitly declared, it is the type of the value returned. An _access modifier_ can be specified for functions, making only desired functions available for use external to the module. In a function, the value of the last line is _implicitly returned_ to the calling function.

Invoking a function is done by specifying its module- and function name and passing arguments for each of the function's parameters. The module name may be omitted if the function is invoked inside of the module.

You may also write short functions using a one-line syntax (note the comma `,` and the colon `:` around the keyword `do`).

```elixir
defmodule Calculator do
  def add(x, y) do
    x + y
  end

  def short_add(x, y), do: x + y
end

sum = Calculator.add(1, 2)
# => 3
sum = Calculator.short_add(2, 2)
# => 4
```

## Arity of Functions

It is common to refer to functions with their _arity_. The _arity_ of a function is the number of parameters it accepts.

```elixir
# add/3 because this function has three parameters, thus an arity of 3
def add(x, y, z) do
  x + y + z
end
```

## Documentation

Documentation is a priority in high-quality Elixir code bases, and there are 3 ways to write inline documentation:

- Comments can be used for inline documentation. Single line comments in Elixir are preceded by `#`.
- Function-level documentation uses the `@doc` annotation preceding named function definitions
- Module-level documentation uses the `@moduledoc` annotation following the module definition

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
