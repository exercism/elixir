In Elixir, a single function can have multiple clauses. This is achieved by pattern matching the function's arguments and by using guards.

```elixir
# pattern matching the argument
def number(7) do
  "Awesome, that's my favorite"
end

# using a guard
def number(n) when is_integer(n) do
  "That's not my favorite"
end

def number(_n) do
  "That's not even a number!"
end
```

- Use [multiple function clauses][multi-function-clause] to extract control logic from functions
- Clauses are attempted in order, from top to bottom of the source file until one succeeds
- If none succeed, a `FunctionClauseError` is raised by the BEAM VM.
- If argument variables are unused in the body of the function, they should be prefixed with an `_` otherwise a warning is emitted by the compiler.

Note that multiple clause functions should not be confused with function overloading that you might know from other programming languages. In Elixir, functions are identified by their name and arity only, not types of arguments (since there is no static typing). The function `number/1` is considered to be a single function regardless of how many clauses it has.

[multi-function-clause]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
