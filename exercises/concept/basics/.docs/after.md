Elixir is a dynamically-typed language, meaning that the type of a variable is only checked at runtime.  In Elixir, we refer to variable assignment as being _bound_ to a value.  Using the [match `=` operator][match], we can bind a value to a variable name:

```elixir
variable = 10 # Bind the integer value 10
```

Re-binding a variable's value is also done performed with the [match `=` operator][match]. Once defined, a variable's type can change when re-bound.

```elixir
count = 1 # Bind an integer literal value of 1
count = 2 # Re-bind to the new value of 2

# Compiler does not error when binding a new type to the variable
count = false
```

Elixir is an [functional-programming language][functional-programming] and requires all named [functions][functions] to be defined in a [module][modules]. The `defmodule` keyword is used to define a module. All modules are available to all other modules at runtime and do not require an _access modifier_ to make them visible to other parts of the program.  A [module][modules] is analogous to a _class_ in other programming languages.

_Named Functions_ must be defined in a module.  Each [function][functions] can have zero or more parameters. All parameters are dynamically typed, and the return type is not explicitly declared, it is the type of the value returned. An _access modifier_ can be specified for functions, making only desired functions available for use external to the module. In a function, the value of the last line is _implicitly returned_ to the calling function.

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

If the function to be called is defined in the same module as the function that calls it, the module name can be omitted.

When referring to functions, refer to them with their _arity_. The _arity_ of a function is the number or parameters it takes.

```elixir
# add_3/1 because this function has one parameter, thus an arity of 1
def add_3(x) do
  3 + x
end
```

Elixir supports one type of comment for [inline documentation][inline-documentation]. Single line comments are preceded by `#`.

Integer values are defined as one or more (consecutive) digits and support the [default mathematical operators][operators].

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
[match]: https://elixirschool.com/en/lessons/basics/pattern-matching/
[inline-documentation]: https://elixirschool.com/en/lessons/basics/documentation/#inline-documentation
[operators]: https://elixir-lang.org/getting-started/basic-types.html#basic-arithmetic
[modules]: https://elixirschool.com/en/lessons/basics/modules/#modules
[functions]: https://elixirschool.com/en/lessons/basics/functions/#named-functions
