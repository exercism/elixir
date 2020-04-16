Elixir is a dynamically-typed language, meaning that the type of a variable is only checked at runtime. Using the match `=` operator, we can bind a value to a variable name:

```elixir
variable = 10 # Bind the integer value 10
```

Re-binding a variable's value is also done performed with the `=` operator. Once defined, a variable's type can change when re-bound.

```elixir
count = 1 # Bind an integer value of 1
count = 2 # Re-bind to the new value of 2

# Compiler does not error when binding a new type to the variable
count = false
```

Elixir is an [functional-programming language][functional-programming] and requires all named functions to be defined in a _module_. The `defmodule` keyword is used to define a module. All modules are available to all other modules at runtime and do not require an _access modifier_ to make them visible to other parts of the program.  A _module_ is analogous to a _class_ in other programming languages.

```elixir
defmodule Calculator do
  # ...
end
```

_Named Functions_ must be defined in a module. Each function can have zero or more parameters. All parameters are dynamically typed, and the return type is not explicitly declared, it is the type of the value returned. An _access modifier_ can be specified for functions, making only desired functions available for use external to the module. In a function, the value of the last line is _implicitly returned_ to the calling function.

```elixir
defmodule Calculator do
  def add(x, y) do
    x + y
  end
end
```

Invoking a function is done by specifying its module- and function name and passing arguments for each of the functions's parameters. The module name may be omitted if the function is invoked inside of the module.

```elixir
sum = Calculator.add(1, 2)
```

When referring to functions, it is very common to refer to them with their _arity_. The _arity_ of a function is the number or parameters it takes.

```elixir
# add/3 because this function has three parameters, thus an arity of 3
def add(x, y, z) do
  x + y + z
end
```

Comments can be used for inline documentation. Single line comments in Elixir are preceded by `#`.

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
