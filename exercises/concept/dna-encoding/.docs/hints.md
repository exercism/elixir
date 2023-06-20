# Hints

## General

- Use `?` to work with the character [code points][codepoint].
- `\s` can be used to represent a space.
- Use [integer binary notation][integer-literal] for working with the codes.
- Try to use the tail call recursion strategy.

## 1. Encode nucleic acid to binary value

- This function needs to map one integer to another.
- This function doesn't need recursion.
- Making use of multiple clause functions may make this easier by breaking it down.

## 2. Decode the binary value to the nucleic acid

- This function is the opposite of part 1's function.
- This function doesn't need recursion.
- Making use of multiple clause functions may make this easier by breaking it down.

## 3. Encode a DNA charlist

- Create a tail-recursive function which takes a code point from the charlist and recursively builds the bitstring result.
- Tail-recursive functions need an accumulator.
- Remember, a [charlist][charlist] is a list of [integer code points][codepoint].
- You can get the first and remaining items from a list using a built-in [`Kernel` module][kernel] function.
- You can also pattern match on a list using the [`[head | tail]`][list] notation.
- Use multiple clause functions to separate the base case from the recursive cases.
- Do not forget to specify the types of bitstring segments using the `::` operator.

## 4. Decode a DNA bitstring

- Create a tail-recursive function which [matches the first 4 bits][bitstring-matching] from the [bitstring][bitstring] and recursively builds the [charlist][charlist] result.
- Tail-recursive functions need an accumulator.
- Remember the [bitstring special form][bitstring-form] can be used for matching on bitstrings.
- Do not forget to specify the types of bitstring segments using the `::` operator.
- You will need to reverse the accumulator at the end. Write a private tail-recursive `reverse` function to do that and use it in the base-case of the `decode` function.

[integer-literal]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[codepoint]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#unicode-and-code-points
[charlist]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#charlists
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[bitstring-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[bitstring-matching]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-binary-bitstring-matching
[type-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#::/2
[recursion-tco]: https://en.wikipedia.org/wiki/Tail_call
[list]: https://hexdocs.pm/elixir/List.html#content
[kernel]: https://hexdocs.pm/elixir/Kernel.html#functions
