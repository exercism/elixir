[Bitwise binary functions][bitwise-wiki] can be performed on integers using functions from the [Bitwise module][bitwise-hexdocs].

- [`&&&/2`][bitwise-and]: bitwise AND
- [`<<</2`][bitwise-shift-left]: bitwise SHIFT LEFT
- [`>>>/2`][bitwise-shift-right]: bitwise SHIFT RIGHT
- [`^^^/2`][bitwise-xor]: bitwise XOR
- [`|||/2`][bitwise-or]: bitwise OR
- [`~~~/1`][bitwise-not]: bitwise NOT

```elixir
Bitwise.&&&(0b1110, 0b1001)
# => 8 # 0b1000

Bitwise.^^^(0b1110, 0b1001)
# => 7 # 0b0111
```

[bitwise-hexdocs]: https://hexdocs.pm/elixir/Bitwise.html
[bitwise-wiki]: https://en.wikipedia.org/wiki/Bitwise_operation
[bitwise-and]: https://hexdocs.pm/elixir/Bitwise.html#&&&/2
[bitwise-shift-left]: https://hexdocs.pm/elixir/Bitwise.html#<<</2
[bitwise-shift-right]: https://hexdocs.pm/elixir/Bitwise.html#>>>/2
[bitwise-xor]: https://hexdocs.pm/elixir/Bitwise.html#^^^/2
[bitwise-or]: https://hexdocs.pm/elixir/Bitwise.html#|||/2
[bitwise-not]: https://hexdocs.pm/elixir/Bitwise.html#~~~/2
