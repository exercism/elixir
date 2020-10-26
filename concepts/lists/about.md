[Lists][list] are a basic data type in Elixir for holding a collection of values. Lists are _immutable_, meaning they cannot be modified; any operation that changes a list returns a new list. Lists implement the [Enumerable protocol][enum-protocol], which allows the use of [Enum][enum] and [Stream][stream] module functions.

Lists in Elixir are implemented as a Linked List, and not as an array of contiguous memory location. Therefore, accessing an element in the list takes linear time depending on the length of the list.

Lists can be written in literal form, head-tail notation, (which uses the `cons` operator `|`), or a combination of both:

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

There can also be more than one element before the _cons_ [`|`] operator.

```elixir
# Multiple prepends
[1, 2, 3 | [4, 5]]
```

Head-tail notation can be used to append items to a list.

```elixir
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
```

Appending elements to a list during iteration is considered an anti-pattern. Appending an element requires walking through the entire list and adding the element at the end, therefore, appending a new element in each iteration would require walking through the entire list in each iteration.

We can achieve the same result by prepending an element to the reversed list, and then reversing the result. Prepending is a fast operation and requires constant time.

```elixir
# Appending to the end of a list (potentially slow)
[1, 2, 3] ++ [4] ++ [5] ++ [6]

# Prepend to the start of a list (faster, due to the nature of linked lists)
[6 | [5 | [4 | [3, 2, 1]]]] # then reverse!
```

There are several common functions for lists:

- [`hd/1`][hd] returns the _head_ of a list -- the _first_ item in a list.
- [`tl/1`][tl] returns the _tail_ of the list -- the list _minus_ the _first_ item.
- [`length/1`][length] returns the number items in the list.
- [`in/2`][in] returns a boolean value indicating whether the item is an element in the list.

Lists may contain any data-type and a mix of data-types.

```elixir
list = [1, :a, 2.0, "string"]
```

[enum]: https://hexdocs.pm/elixir/Enum.html
[enum-protocol]: https://hexdocs.pm/elixir/Enumerable.html
[hd]: https://hexdocs.pm/elixir/Kernel.html#hd/1
[in]: https://hexdocs.pm/elixir/Kernel.html#in/2
[length]: https://hexdocs.pm/elixir/Kernel.html#length/1
[list]: https://hexdocs.pm/elixir/List.html
[stream]: https://hexdocs.pm/elixir/Stream.html
[tl]: https://hexdocs.pm/elixir/Kernel.html#tl/1
