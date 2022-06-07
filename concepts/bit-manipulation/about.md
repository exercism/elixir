# About

[Bitwise binary functions][bitwise-wiki] can be performed on integers using functions from the [Bitwise module][bitwise-hexdocs].

- [`band/2`][bitwise-and]: bitwise AND
- [`bsl/2`][bitwise-shift-left]: bitwise SHIFT LEFT
- [`bsr/2`][bitwise-shift-right]: bitwise SHIFT RIGHT
- [`bxor/2`][bitwise-xor]: bitwise XOR
- [`bor/2`][bitwise-or]: bitwise OR
- [`bnot/1`][bitwise-not]: bitwise NOT

```elixir
Bitwise.band(0b1110, 0b1001)
# => 8 # 0b1000

Bitwise.bxor(0b1110, 0b1001)
# => 7 # 0b0111
```

[bitwise-hexdocs]: https://hexdocs.pm/elixir/Bitwise.html
[bitwise-wiki]: https://en.wikipedia.org/wiki/Bitwise_operation
[bitwise-and]: https://hexdocs.pm/elixir/Bitwise.html#band/2
[bitwise-shift-left]: https://hexdocs.pm/elixir/Bitwise.html#bsl/2
[bitwise-shift-right]: https://hexdocs.pm/elixir/Bitwise.html#bsr/2
[bitwise-xor]: https://hexdocs.pm/elixir/Bitwise.html#bxor/2
[bitwise-or]: https://hexdocs.pm/elixir/Bitwise.html#bor/2
[bitwise-not]: https://hexdocs.pm/elixir/Bitwise.html#bnot/2
