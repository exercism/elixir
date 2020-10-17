The [`Stream` module][stream] is a _lazy_ alternative to the _eager_ [`Enum` module][enum]. Streams:

- Implement the [_Enumerable protocol_][enumerable].
- Are composable.
- Are internally represented as functions.
- Can be infinite.

Streams are ideal for dealing with slow resources and very large, potentially infinite, collections. For all other cases, use `Enum` instead.

[stream]: https://hexdocs.pm/elixir/Stream.html
[enum]: https://hexdocs.pm/elixir/Enum.html
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
