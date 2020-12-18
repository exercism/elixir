[Ranges][range] represent a sequence of one or many consecutive integers. They:

- Are created using the [`..` operator][range-operator] and can be both ascending or descending.
- Are inclusive of the first and last values.
- Implement the [_Enumerable protocol_][enumerable].
- Are represented internally as a struct, but can be pattern matched using `..`.
- Can be used with integers written in the binary, octal, hexadecimal, and code point notation.
- Can be turned into lists with functions such as [`Enum.to_list/1`][enum-to-list] or [`Enum.map/2`][enum-map].

```elixir
Enum.to_list(9..1)
# => [9, 8, 7, 6, 5, 4, 3, 2, 1]

Enum.map(?A..?F, & <<&1>>)
["A", "B", "C", "D", "E", "F"]
```

[range-operator]: https://hexdocs.pm/elixir/Kernel.html#../2
[range]: https://hexdocs.pm/elixir/Range.html
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
[enum-to-list]: https://hexdocs.pm/elixir/Enum.html#to_list/1
[enum-map]: https://hexdocs.pm/elixir/Enum.html#to_list/1
