Keyword lists are a key-value data structure.

```elixir
[month: "April", year: 2018]
```

Keyword lists are lists of `{key, value}` tuples, and can also be written as such, but the shorter syntax is more widely used.

```elixir
[month: "April"] == [{:month, "April"}]
# => true
```

Keys in a keyword list must be atoms, but the values can be anything. Each key can be used more than once. The key/value pairs in a keyword list are ordered.

You can work with keyword lists using the same approaches as for lists, or you can use the `Keyword` module.
