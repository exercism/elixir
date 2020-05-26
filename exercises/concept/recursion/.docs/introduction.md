Recursive functions are functions that call themselves.

A recursive function needs to have at least one _base case_ and at least one _recursive case_.

A _base case_ returns a value without calling the function again. A _recursive case_ calls the function again, modifying the input so that it will at some point match the base case.

Very often, each case is written in its own function clause.

```elixir
# base case
def count([]), do: 0

# recursive case
def count([_head | tail]), do: 1 + count(tail)
```
