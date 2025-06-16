# About

A `MapSet` is a collection of unique values, representing sets in Elixir.
It can contain values of any kind, without a notion of order.

Note that the `Set` module also exists, but it is deprecated in favor of `MapSet`.

You can create sets using `MapSet.new/0`, `MapSet.new/1` and `MapSet.new/3`, and transform them into lists using `MapSet.to_list/1`.

```elixir
MapSet.new()
# => MapSet.new([])

MapSet.new([2, 3, 3, 3, 1, 1, 2, "hello"])
# => MapSet.new([1, 2, 3, "hello"])

MapSet.new([2, 3, 3, 3, 1, 1, 2], fn n -> 10 * n end)
# => MapSet.new([10, 20, 30])

[2, 3, 3, 3, 1, 1, 2] |> MapSet.new() |> MapSet.to_list()
# => [1, 2, 3]
```

Note that since `MapSet`s do not have a notion of order, `MapSet.to_list/1` is not guaranteed to return a sorted list.

You can add or remove elements with `MapSet.put/2` and `MapSet.delete/2`.

You can query the contents of a set with the functions `MapSet.size/1`, `MapSet.member?/2`, and compare sets with `MapSet.equal?/2`, `MapSet.subset?/2` and `MapSet.disjoint?/2`.

```elixir
a = MapSet.new([1, 10])
b = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

MapSet.size(b)
# => 10

MapSet.member?(a, 10)
# => true

MapSet.subset?(a, b)
# => true

MapSet.disjoint?(a, b)
# => false
```

MapSets can be combined with `MapSet.union/2`, `MapSet.intersection/2`, `MapSet.difference/2` and `MapSet.symmetric_difference/2`.

```elixir
a = MapSet.new([1, 10, 100])
b = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

MapSet.union(a, b)
# => MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100])

MapSet.intersection(a, b)
# => MapSet.new([1, 10])

MapSet.difference(a, b)
# => MapSet.new([100])

MapSet.difference(b, a)
# => MapSet.new([2, 3, 4, 5, 6, 7, 8, 9])

MapSet.symmetric_difference(b, a)
# => MapSet.new([2, 3, 4, 5, 6, 7, 8, 9, 100])
```

You can filter and partition sets with `MapSet.filter/2`, `MapSet.reject/2` and `MapSet.split_with/2`.

```elixir
a = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
even = fn n -> rem(n, 2) == 0 end

MapSet.filter(a, even)
# => MapSet.new([2, 4, 6, 8, 10])

MapSet.reject(a, even)
# => MapSet.new([1, 3, 5, 7, 9])

 MapSet.split_with(a, even)
# => {MapSet.new([2, 4, 6, 8, 10]), MapSet.new([1, 3, 5, 7, 9])}
```
