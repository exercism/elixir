[Ranges][range] represent a sequence of one or many consecutive integers. They:

- Are created using the [`..` operator][range-operator] and can be both ascending or descending.
- Are inclusive of the last value.
- Implement the [_Enumerable protocol_][enumerable].
- Are represented internally as a struct, but can be pattern matched using `..`.
- Can be used with integers written in the binary, octal, hexadecimal, and codepoint notation.

```elixir
Enum.map(?D..?A, & &1 + 3)
# => 'GFED'
```

[range-operator]: https://hexdocs.pm/elixir/Kernel.html#../2
[range]: https://hexdocs.pm/elixir/Range.html
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
