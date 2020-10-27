## General

- Read about the `Enum` module in the [official Getting Started guide][getting-started-enum] or on [elixirschool.com][elixir-school-enum]
- Take a look in the documentation for the full [list of functions in the `Enum` module][enum-functions].

## 1. Sort items by price

- There is a [built-in function][enum-sort-by] for sorting enumerables using a sorter function.

## 2. Find all items with missing prices

- There is a [built-in function][enum-filter] for filtering enumerables.

## 3. Increment the item's quantity

- Maps implement the enumerable protocol.
- `Enum` functions convert maps to a list of `{key, value}` tuples.
- There is a [built-in function][enum-map] for replacing every element in an enumerable with another element.
- There is a [built-in function][enum-into] that can transform a list of `{key, value}` tuples back into a map.

## 4. Calculate the item's total quantity

- Maps are enumerables too.
- Iterating over a map will convert the map to a list of `{key, value}` tuples.
- There is a [built-in function][enum-reduce] for reducing an enumerable to a single value.

[gettin-started-enum]: https://elixir-lang.org/getting-started/enumerables-and-streams.html#enumerables
[elixir-school-enum]: https://elixirschool.com/en/lessons/basics/enum/
[enum-functions]: https://hexdocs.pm/elixir/Enum.html#functions
[enum-sort-by]: https://hexdocs.pm/elixir/Enum.html#sort_by/3
[enum-filter]: https://hexdocs.pm/elixir/Enum.html#filter/2
[enum-map]: https://hexdocs.pm/elixir/Enum.html#map/2
[enum-into]: https://hexdocs.pm/elixir/Enum.html#into/2
[enum-reduce]: https://hexdocs.pm/elixir/Enum.html#reduce/3
