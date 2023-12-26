# Hints

## General

- Read about keyword lists in the official [Getting Started guide][getting-started-keyword-lists].
- Read about keyword lists on [elixirschool.com][elixir-school-keyword-lists].
- Take a look at the [documentation of the `Keyword` module][keyword].

## 1. Explain wine colors

- You need to write the information given in the table as a keyword list.
- Take a look at some [examples][keyword-examples] of how to define a keyword list.

## 2. Get all wines of a given color

- There is a [built-in function][keyword-get-values] for getting the list of all values for a given key.

## 3. Get all wines of a given color bottled in a given year

- There is a [built-in function][keyword-get] for getting a single value for a given key.
- You do not need to implement the filtering of bottles on your own. You just need to conditionally use the already-implemented `filter_by_year/2` function.

## 4. Get all wines of a given color bottled in a given country

- There is a [built-in function][keyword-get] for getting a single value for a given key.
- You do not need to implement the filtering of bottles on your own. You just need to conditionally use the already-implemented `filter_by_country/2` function.

[getting-started-keyword-lists]: https://hexdocs.pm/elixir/keywords-and-maps.html#keyword-lists
[elixir-school-keyword-lists]: https://elixirschool.com/en/lessons/basics/collections/#keyword-lists
[keyword]: https://hexdocs.pm/elixir/Keyword.html
[keyword-get-values]: https://hexdocs.pm/elixir/Keyword.html#get_values/2
[keyword-get]: https://hexdocs.pm/elixir/Keyword.html#get/3
[keyword-examples]: https://hexdocs.pm/elixir/Keyword.html#module-examples
