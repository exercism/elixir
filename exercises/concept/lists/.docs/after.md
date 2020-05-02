## Key Points

- [Lists][list] are a basic data type.
- [Lists][list] are implemented as a linked list.
- [Lists][list] implement the [Enumerable protocol][enum-protocol], which allows the use of [Enum][enum] and [Stream][stream] module functions.
- [Lists][list] can be written in literal form or head-tail notation or mixed.

  ```elixir
  # Literal Form
  []
  [1]
  [1, 2, 3]

  # Head-tail Notation
  []
  [1 | []]
  [1 | [2 | [3 | []]]]

  # Mixed
  [1 | [2, 3]]
  ```

- Head-tail notation can be used to append items to a list.

  ```elixir
  list = [2, 1]

  [3, 2, 1] == [3 | list]
  # => true
  ```

- There are several common functions for [lists][list]:
  - [`hd/1`][hd] returns the _head_ of a list -- the _first_ item in a list.
  - [`tl/1`][tl] returns the _tail_ of the list -- the list _minus_ the _first_ item.
  - [`length/1`][length] returns the number items in the list.
  - [`in/2`][in] returns a boolean value whether the item is an element in the list.
- They may contain any data-type and a mix of data-types.

  ```elixir
  list = [1, :a, 2.0, "string"]
  ```

- [String][string] literals are a sequence of characters surrounded by double quotes.

  ```elixir
  string = "this is a string! 1, 2, 3!"
  ```

[enum]: https://hexdocs.pm/elixir/Enum.html
[enum-protocol]: https://hexdocs.pm/elixir/Enumerable.html
[hd]: https://hexdocs.pm/elixir/Kernel.html#hd/1
[in]: https://hexdocs.pm/elixir/Kernel.html#in/2
[length]: https://hexdocs.pm/elixir/Kernel.html#length/1
[list]: https://hexdocs.pm/elixir/List.html
[stream]: https://hexdocs.pm/elixir/Stream.html
[string]: https://elixir-lang.org/getting-started/basic-types.html#strings
[tl]: https://hexdocs.pm/elixir/Kernel.html#tl/1
