Comprehensions provide a facility for transforming _Enumerables_ easily and declaratively. There are three required parts to a comprehension:

- _generators_:
  - Values enumerated from structures that implement the _Enumerable_ protocol.
  - Pattern matching expressions to destructure enumerated values.
- _filters_: Boolean conditions, used to select which enumerated values to use when creating the new values.
- _collectables_: A structure which implements the _Collectable_ protocol, used to collect the new values.

To declare a very simple comprehension, we can use the `for` keyword followed by a _generator_ and a _do-block_ which creates the new values from the enumerated values.

```elixir
for n <- [0, 1, 2, 3], do: n + 1
# => [1, 2, 3, 4]
```

We can declare more complicated comprehensions over several lines:

```elixir
for {atom, number} <- [a: 1, b: 2, c: 3, d: 4],
    rem(number, 2) == 0 do
  atom
end
# => [:b, :d]
```

A _cartesian product_ can be created using multiple generators:

```elixir
for x <- [0, 1],
    y <- [0, 1] do
  {x, y}
end
# => [{0, 0}, {0, 1}, {1, 0}, {1, 1}]
```
