## General

- Review the Elixir documentation:
  - [Comprehensions][elixir-comprehensions]
  - [Lists][elixir-lists]
  - [Maps][elixir-maps]
  - [Keyword Lists][elixir-kwlists]

## 1. Suggest a combination

- In the list comprehension, use two _generators_ to create the cartesian product.

## 2. Filter out clashing outfits

- You can use _pattern matching_ to deconstruct in the _generator_ to bind the fields to a variable.
- Use a _filter_ expression to return false when the base colors match.

## 3. Filter by combination price

- There a number of [keyword list functions][kw-module] available to use to retrieve options from a keyword list.
- Use a _filter_ expression to return false when the combined price is greater than the maximum price.

[elixir-lists]: https://elixir-lang.org/getting-started/basic-types.html#linked-lists
[elixir-maps]: https://elixir-lang.org/getting-started/keywords-and-maps.html#maps
[elixir-kwlists]: https://elixir-lang.org/getting-started/keywords-and-maps.html#keyword-lists
[elixir-comprehensions]: https://elixir-lang.org/getting-started/comprehensions.html
[kw-module]: https://hexdocs.pm/elixir/Keyword.html
