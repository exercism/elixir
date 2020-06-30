Comprehensions provide a facility for transforming _Enumerables_ easily and declaratively. To review, there are three required parts to a comprehension:

- _generators_:
  - Values enumerated from structures that implement the _Enumerable_ protocol.
  - Pattern matching expressions to destructure enumerated values.
- _filters_: Boolean conditions, used to select which enumerated values to use when creating the new values.
- _collectables_: A structure which implements the _Collectable_ protocol, used to collect the new values.

The comprehension is _syntactic sugar_ for coding the recursive structure each time.

There are single- and multi-line comprehensions. When more than one generator is used, a cartesian product of the values generated is enumerated:

```elixir
for n <- [0, 1, 2, 3], do: n + 1
# => [1, 2, 3, 4]

for x <- [0, 1],
    y <- [0, 1] do
  {x, y}
end
# => [{0, 0}, {0, 1}, {1, 0}, {1, 1}]
```

The value in the do-block is inserted into the _collectable_ **for each value generated** from the _enumerable_. It may or may not include variable bound inside of the comprehension.

```elixir
for _ <- [1, 2, 3], do: :a
# => [:a, :a, :a]
```

Pattern matching can occur in the comprehension, either on the left side of the `<-` or on their own line.

```elixir
for {atom, str} <- [a: "string"], do: str
# => ["string"]

for pair <- [a: "string"],
    {atom, str} = pair do
  str
end
# => ["string"]
```

## Resources

- Elixir documentation:
  - [Comprehensions][elixir-comprehensions]
  - [Kernel `for/1` macro function][for]

[elixir-comprehensions]: https://elixir-lang.org/getting-started/comprehensions.html
[for]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1
