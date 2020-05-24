## Multiple Function Clauses

- Use [multiple function clauses][multi-function-clause] to extract control logic from functions
- Clauses are attempted in order, from top to bottom of the source file until one succeeds
- If none succeed, a `FunctionClauseError` is raised by the BEAM VM.
- If argument variables are unused in the body of the function, they should be prefixed with an `_` otherwise a warning is emitted by the compiler.

## Guards

- [Guards][guards] are used to prevent Elixir from invoking functions or prevent pattern matching.
- [Guard][guards] functions are special functions which:
  - Must be [pure][pure-function] and not mutate any global states.
  - Must return strict `true` or `false` values.
- [Guards][guards] begin with the `when` keyword, followed by a boolean expression.
- A list of common [guards][kernel-guards] are found in the [Elixir documentation][kernel-guards].

## Default arguments

- Functions may declare [default values][default-arguments] for one or more arguments.

```elixir
def number(n \\ 13), do: "That's not my favorite"
```

- During compilation, Elixir creates a function definition for `number/0` (no arguments), and `number/1` (one argument).
- If more than one argument has default values, the default values will be applied to the function from left to right to fill in for missing parameters.
- If the function has multiple clauses, it is required to write a [function header][function-header] for the default arguments.

```elixir
def guess(number \\ 5)
def guess(number) when number != 5, do: false
def guess(number) when number == 5, do: true

guess()
# => true
```

[default-arguments]: https://elixir-lang.org/getting-started/modules-and-functions.html#default-arguments
[function-header]: https://inquisitivedeveloper.com/lwm-elixir-25/
[guards]: https://hexdocs.pm/elixir/master/patterns-and-guards.html#guards
[kernel-guards]: https://hexdocs.pm/elixir/master/Kernel.html#guards
[multi-function-clause]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[pure-function]: https://gist.github.com/tomekowal/16cb4192b73fe9222de9fd09e653c03e
