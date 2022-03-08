# Introduction

`Enum` is a very useful module that provides a set of algorithms for working with enumerables. It offers sorting, filtering, grouping, counting, searching, finding min/max values, and much more.

In general, an _enumerable_ is any data that can be iterated over, a collection. In Elixir, an enumerable is any data type that implements the `Enumerable` [protocol][exercism-protocols]. The most common of those are [lists][exercism-lists] and [maps][exercism-maps].

Many `Enum` functions accept a function as an argument.

```elixir
Enum.all?([1, 2, 3, 4, 5], fn x -> x > 3 end)
# => false
```

The most common `Enum` functions are `map` and `reduce`.

## `map/2`

`Enum.map/2` allows you to replace every element in an enumerable with another element. The second argument to `Enum.map/2` is a function that accepts the original element and returns its replacement.

## `reduce/3`

`Enum.reduce/3` allows you to _reduce_ the whole enumerable to a single value. To achieve this, a special variable called the _accumulator_ is used. The accumulator carries the intermediate state of the reduction between iterations.

The second argument to `Enum.reduce/3` is the initial value of the accumulator. The third argument is a function that accepts an element and an accumulator, and returns the new value for the accumulator.

## Working with maps

When using maps with `Enum` functions, the map gets automatically converted to a list of 2 `{key, value}` tuples.

To transform it back to a map, use `Enum.into/2`. `Enum.into/2` is a function that transforms an enumerable into a collectable - any data structure implementing the `Collectable` protocol. It can be thought of as the opposite of `Enum.reduce/3`.

[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols
[exercism-lists]: https://exercism.org/tracks/elixir/concepts/lists
[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps
