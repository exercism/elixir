# Hints

## General

- Read about the `Enum` module in the [official Getting Started guide][getting-started-enum] or on [elixirschool.com][elixir-school-enum].
- Take a look in the documentation for the full [list of functions in the `Enum` module][enum-functions].

## 1. Sort items by price

- There is a [built-in function][enum-sort-by] for sorting enumerables using a sorter function.

## 2. Find all items with missing prices

- There is a [built-in function][enum-filter] for filtering enumerables.

## 3. Update item names

- There is a [built-in function][enum-map] for transforming every element in an enumerable.
- There is a [built-in function][string-replace] that can replace all instances of one string with a different one.

## 4. Increment the item's quantity

- Maps implement the enumerable protocol.
- `Enum` functions convert maps to a list of `{key, value}` tuples.
- There are two different functions that can transform a list of `{key, value}` tuples back into a map using a transformation function. [One of them always returns a new map][map-new], while [the other lets you choose a collectible][enum-into].

## 5. Calculate the item's total quantity

- Maps implement the enumerable protocol.
- `Enum` functions convert maps to a list of `{key, value}` tuples.
- There is a [built-in function][enum-reduce] for reducing an enumerable to a single value.

[getting-started-enum]: https://elixir-lang.org/getting-started/enumerables-and-streams.html#enumerables
[elixir-school-enum]: https://elixirschool.com/en/lessons/basics/enum/
[enum-functions]: https://hexdocs.pm/elixir/Enum.html#functions
[enum-sort-by]: https://hexdocs.pm/elixir/Enum.html#sort_by/3
[enum-filter]: https://hexdocs.pm/elixir/Enum.html#filter/2
[enum-map]: https://hexdocs.pm/elixir/Enum.html#map/2
[enum-into]: https://hexdocs.pm/elixir/Enum.html#into/3
[enum-reduce]: https://hexdocs.pm/elixir/Enum.html#reduce/3
[map-new]: https://hexdocs.pm/elixir/Map.html#new/2
[string-replace]: https://hexdocs.pm/elixir/String.html#replace/4
