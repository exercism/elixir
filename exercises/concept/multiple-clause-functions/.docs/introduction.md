## Multiple Function Clauses

Elixir facilitates **Open-Close Principle** practices by allowing functions to have multiple clauses, so instead of sprawling and hard-coded control-logic, pointed functions can be written to add/remove behavior easily.

Elixir offers _multiple function clauses_ and _guards_ to write:

```elixir
def number(n) when n == 7 do
  "Awesome, that's my favorite"
end
def number(_n) do
  "That's not my favorite"
end
```

At run-time, Elixir will test, from top to bottom of the source file, which function clause to invoke.

Variables that are unused in the function body should be prefixed with an underscore.

## Guards

Guards are used to prevent Elixir from invoking functions based on evaluation of the parameters by guard functions. Guards begin with the `when` keyword, followed by a boolean expression. Guard functions are special functions which:

- Must be pure and not mutate any global states.
- Must return strict `true` or `false` values.

A list of common guards are found in the [Elixir documentation][kernel-guards]

## Default arguments

Functions may declare default values for one or more arguments. When compiled, Elixir creates a function definition for `number/0` (no arguments), and `number/1` (one argument).

```elixir
def number(n \\ 13), do: "That's not my favorite"
```

If more than one argument has default values, the default values will be applied to the function from left to right to fill in for missing parameters.

[kernel-guards]: https://hexdocs.pm/elixir/master/Kernel.html#guards
