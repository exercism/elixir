# Introduction

Elixir facilitates **Open-Closed Principle** practices by allowing functions to have multiple clauses, so instead of sprawling and hard-coded control-logic, pointed functions can be written to add/remove behavior easily.

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

Variables that are unused should be prefixed with an underscore.
