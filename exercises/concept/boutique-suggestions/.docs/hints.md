# Hints

## General

- Read about [comprehensions][elixir-comprehensions] in the Getting Started guide.
- Read about [lists][elixir-lists] in the Getting Started guide.
- Read about [maps][elixir-maps] in the Getting Started guide.
- Read about [keyword Lists][elixir-kwlists] in the Getting Started guide.

## 1. Suggest a combination

- In the list comprehension, use two _generators_ to create the cartesian product.

## 2. Filter out clashing outfits

- You can use _pattern matching_ to deconstruct in the _generator_ to bind the fields to a variable.
- Use a _filter_ expression to return false when the base colors match.

## 3. Filter by combination price

- There a number of [keyword list functions][kw-module] available to use to retrieve options from a keyword list.
- Use a _filter_ expression to return false when the combined price is greater than the maximum price.

[elixir-lists]: https://hexdocs.pm/elixir/lists-and-tuples.html#linked-lists
[elixir-maps]: https://hexdocs.pm/elixir/keywords-and-maps.html#maps-as-key-value-pairs
[elixir-kwlists]: https://hexdocs.pm/elixir/keywords-and-maps.html#keyword-lists
[elixir-comprehensions]: https://hexdocs.pm/elixir/comprehensions.html
[kw-module]: https://hexdocs.pm/elixir/Keyword.html
