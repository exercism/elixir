`Enum` is a very useful module that provides a set of algorithms for working with enumerables. It offers:

- sorting ([`sort/2`][enum-sort/2], [`sort_by/2`][enum-sort_by/2]),
- filtering ([`filter/2`][enum-filter/2]),
- grouping ([`group_by/3`][enum-group_by/3]),
- counting ([`count/2`][enum-count/2])
- searching ([`find/3`][enum-find/3]),
- finding min/max values ([`min/3`][enum-min/3], [`max/3`][enum-max/3]),
- reducing ([`reduce/3`][enum-reduce/3], [`reduce_while/3`][enum-reduce_while/3]),

And much more! Refer to the [`Enum` module documentation][enum-functions] for a full list.

## Enumerable

In general, an _enumerable_ is any data that can be iterated over, a collection. In Elixir, an enumerable is any data type that implements the `Enumerable` protocol. Those are:

- [`List`][list]
- [`Map`][map]
- [`Range`][range]
- [`Stream`][stream]
- [`MapSet`][mapset]
- [`Function`][function]
- [`Date.Range`][data-range]
- [`IO.Stream`][io-stream]
- [`File.Stream`][file-stream]

Don't worry if you don't know them all yet.

As we will learn in a later exercise about protocols, anyone can implement the `Enumerable` protocol for their own custom data structure.

## Reduce

`Enum.reduce/2` allows you to _reduce_ the whole enumerable to a single value. To achieve this, a special variable called the _accumulator_ is used. The accumulator carries the intermediate state of the reduction between iterations. This makes it one of the most powerful functions for enumerables. Many other specialized functions could be replaced by the more general `reduce`. For example...

Finding the maximum value:

```elixir
Enum.max([4, 20, 31, 9, 2])
# => 31

Enum.reduce([4, 20, 31, 9, 2], nil, fn x, acc ->
  cond do
    acc == nil -> x
    x > acc -> x
    x <= acc -> acc
  end
end)
# => 31
```

And even mapping (but it requires reversing the result afterwards):

```elixir
Enum.map([1, 2, 3, 4, 5], fn x -> x + 10 end)
# => [11, 12, 13, 14, 15]

Enum.reduce([1, 2, 3, 4, 5], [], fn x, acc -> [x + 10 | acc] end)
# => [15, 14, 13, 12, 11]
```

[enum-functions]: https://hexdocs.pm/elixir/Enum.html#functions
[enum-sort/2]: https://hexdocs.pm/elixir/Enum.html#sort/2
[enum-sort_by/2]: https://hexdocs.pm/elixir/Enum.html#sort_by/2
[enum-filter/2]: https://hexdocs.pm/elixir/Enum.html#filter/2
[enum-group_by/3]: https://hexdocs.pm/elixir/Enum.html#group_by/3
[enum-count/2]: https://hexdocs.pm/elixir/Enum.html#count/2
[enum-find/3]: https://hexdocs.pm/elixir/Enum.html#find/3
[enum-min/3]: https://hexdocs.pm/elixir/Enum.html#min/3
[enum-max/3]: https://hexdocs.pm/elixir/Enum.html#max/3
[enum-reduce/3]: https://hexdocs.pm/elixir/Enum.html#reduce/3
[enum-reduce_while/3]: https://hexdocs.pm/elixir/Enum.html#reduce_while/3
[list]: https://hexdocs.pm/elixir/List.html
[map]: https://hexdocs.pm/elixir/Map.html
[range]: https://hexdocs.pm/elixir/Range.html
[stream]: https://hexdocs.pm/elixir/Stream.html
[mapset]: https://hexdocs.pm/elixir/MapSet.html
[function]: https://hexdocs.pm/elixir/Function.html
[data-range]: https://hexdocs.pm/elixir/Date.Range.html
[io-stream]: https://hexdocs.pm/elixir/IO.Stream.html
[file-stream]: https://hexdocs.pm/elixir/File.Stream.html
