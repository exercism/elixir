Tuples are used commonly to group information informally. A common pattern through Elixir is to group function return values with a status.

```elixir
File.read("hello.txt")
# => {:ok, "World"}

File.read("invalid.txt")
# => {:error, :enoent}
```

- Tuple literals are enclosed with curly braces, `{}`.
- Tuples may hold any data-type in contiguous memory, which is allocated when the tuple is created.
- Tuples allow for constant-time read-access.
- When manipulating a tuple, rather than mutating the existing tuple, a new one is created.
- The performance characteristics of tuples make them ideal for storing related information together, but not for storing collections of items that need iterating or might grow or shrink. In the latter case, [a list is more appropriate][getting-started-lists-or-tuples].
- The [`Kernel`][kernel-module] and [`Tuple`][tuple-module] modules have useful functions for working with tuples.

[tuple-module]: https://hexdocs.pm/elixir/Tuple.html
[kernel-module]: https://hexdocs.pm/elixir/Kernel.html
[getting-started-lists-or-tuples]: https://elixir-lang.org/getting-started/basic-types.html#lists-or-tuples
