## Bitstrings

- [Bitstrings][bitstring] allow programmers to work with binary data effectively.

  - Can construct [bitstrings][bitstring] elegantly using the `<<>>` special form

  ```elixir
  <<0b101::3>> == <<5::3>> and <<5::3>> == <<5::size(3)>>
  # => true

  first = <<0b110::3>>
  second = <<0b001::3>>
  combined = <<first::bitstring, second::bitstring>>
  # => <<49::size(6)>>
  ```

  - Can match using the `<<>>` form and use that match to further decompose binary data

  ```elixir
  <<data_size::32, count::size(data_size)>> = <<8::32, 3::8>>
  # => <<0, 0, 0, 8, 3>>
  data_size
  # => 8
  count
  # => 3
  ```

  - Or you can match on the remainder of the [bitstring][bitstring] using `::bitstring`

  ```elixir
  <<_::32, remainder::bitstring>> = <<8::32, 3::8>>
  # => <<0, 0, 0, 8, 3>>
  remainder
  # => <<3>>
  ```

- The binary data*type* is a specific type of [bitstring][bitstring].
  - All binaries are [bitstrings][bitstring], but not all [bitstrings][bitstring] are binaries.
- Elixir provides syntactic sugar for working with [integer literals][integer-literal] in different forms:
  - `0b1000001 = ?A = 65`

## Tail Call Recursion and Accumulators

- If a language has [tail call optimization][recursion-tco], it often mitigates concerns of overflowing the function call stack.
- In order to achieve [tail call recursion][recursion-tco] in Elixir, an accumulator is often required because of data immutability rules.

  - An accumulator is a variable that is passed along the recursive call keeping the current state of the recursive function _so far_ until the final result is returned in the base case.

  ```elixir
  # Count the length of a list without an accumulator
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  # Count the length of a list with an accumulator
  def count(list), do: do_count(list, 0)

  defp do_count([], count), do: count
  defp do_count([_head | tail], count), do: do_count(tail, count + 1)
  ```

- When working with lists, remember they are implemented as singly-linked lists: prepend operations are very fast, but append operations are very slow.

  ```elixir
  # Reverse a list with an accumulator
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
  ```

[integer-literal]: https://hexdocs.pm/elixir/master/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[codepoint]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#unicode-and-code-points
[charlist]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#charlists
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[bitstring-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[bitstring-matching]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-binary-bitstring-matching
[type-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#::/2
[recursion-tco]: https://en.wikipedia.org/wiki/Tail_call
[hd]: https://hexdocs.pm/elixir/Kernel.html?#hd/1
[tl]: https://hexdocs.pm/elixir/Kernel.html?#tl/1
[list]: https://hexdocs.pm/elixir/List.html#content
