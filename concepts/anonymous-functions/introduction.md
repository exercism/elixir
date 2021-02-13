# Introduction

Functions are treated as first class citizens in Elixir. This means functions:

- Can be assigned to variables.
- Can be passed around like data as arguments and return values.
- Can be created dynamically.

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
