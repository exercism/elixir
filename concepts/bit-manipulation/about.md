[Bitwise binary functions][bitwise-wiki] can be performed on an integers' binary representation using functions from the [Bitwise module][bitwise-hexdocs].

```elixir
Bitwise.&&&(0b1110, 0b1001)
# => 8 # 0b1000

Bitwise.^^^(0b1110, 0b1001)
# => 7 # 0b0111
```

[bitwise-hexdocs]: https://hexdocs.pm/elixir/Bitwise.html
[bitwise-wiki]: https://en.wikipedia.org/wiki/Bitwise_operation
