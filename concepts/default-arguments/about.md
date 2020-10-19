Functions may declare [default values][default-arguments] for one or more arguments.

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
