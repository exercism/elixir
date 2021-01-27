## Anonymous Functions

Functions are treated as first class citizens in Elixir. This means functions:

- Named and anonymous functions can be assigned to variables.
- Named and anonymous functions can be passed around like data as arguments and return values.
- Anonymous functions can be created dynamically.

Anonymous functions, in contrast to named functions, don't have a static reference available to them, they are only available if they are assigned to a variable or immediately invoked.

We might use anonymous functions to:

- Hide data using lexical scope (also known as a closure).
- Dynamically create functions at run-time.

Anonymous function start with the reserved word `fn`, the arguments are separated from the body of the function with the `->` token, and they are finished with an `end`. As with named functions, the last expression in the function is _implicitly returned_ to the calling function.

To invoke a function reference, you must use a `.` between the reference variable and the list of arguments:

```elixir
function_variable = fn param ->
  param + 1
end

function_variable.(1)
# => 2
```

You can even use short hand capture notation to make this more concise:

```elixir
variable = &(&1 + 1)

variable.(1)
# => 2
```

## Closures

Anonymous functions in Elixir are closures. They can access variables that are in scope when the function is defined.

```elixir
a = 7
square = fn -> a * a end
square.()
# => 49
```

## Bit Manipulation

Elixir supports many functions for working with bits found in the _Bitwise module_.

- `&&&/2`: bitwise AND
- `<<</2`: bitwise SHIFT LEFT
- `>>>/2`: bitwise SHIFT RIGHT
- `^^^/2`: bitwise XOR
- `|||/2`: bitwise OR
- `~~~/1`: bitwise NOT

Here is an example how to use a bitwise operator:

```elixir
Bitwise.<<<(1, 2)
# => 4
```

All bitwise functions only work on integers.
