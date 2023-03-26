# Hints

## General

- Read about [bitstrings][bitstring] in the Getting Started guide.
- Review the documentation for the [bitstring special form][bitstring-form].
- Review [how to convert decimal numbers to binary numbers]([decimal-to-binary-youtube]).
- Elixir supports [different ways of writing integers][integer-literal], including binary notation. 

## 1. Calculate palette bit size

- This task doesn't use the bitstring data type.
- Find the smallest positive number `n` such that 2 raised to the power of `n` is greater than or equal than the number of colors we need to represent.
- Create a recursive function for this.
- Choose a starting bit size of 1. If 2 raised to the power of 1 is greater than or equal to the color count, we've found our bit size. If not, add 1 to the bit size and check again (recursion).
- Use [`Integer.pow/2`][integer-pow] to raise 2 to a given power.

[decimal-to-binary-youtube]: https://www.youtube.com/watch?v=gGiEu7QTi68
[integer-literal]: https://hexdocs.pm/elixir/master/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[bitstring-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[bitstring-matching]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-binary-bitstring-matching
[type-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#::/2
[integer-pow]: https://hexdocs.pm/elixir/master/Integer.html#pow/2
