Functions may declare default values for one or more arguments. When compiled, Elixir creates a function definition for `number/0` (no arguments), and `number/1` (one argument).

```elixir
def number(n \\ 13), do: "That's not my favorite"
```

If more than one argument has default values, the default values will be applied to the function from left to right to fill in for missing arguments.

[kernel-guards]: https://hexdocs.pm/elixir/master/Kernel.html#guards
