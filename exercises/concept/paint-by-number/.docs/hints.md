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
- Choose a starting bit size of 1. If 2 raised to the power of the bit size is greater than or equal to the color count, we've found our bit size. If not, add 1 to the bit size and check again (recursion).
- Use [`Integer.pow/2`][integer-pow] to raise 2 to a given power.

## 2. Create an empty picture

- Use the [bitstring special form][bitstring-form] to create a new bitstring.

## 3. Create a test picture

- Use the [bitstring special form][bitstring-form] to create a new bitstring.
- Use the [type operator][type-operator] to specify the bit size of each fragment.

## 4. Prepend a pixel to a picture

- The [bitstring special form][bitstring-form] can be used to append a new fragment to an existing bitstring.
- Use the [type operator][type-operator] to specify the bit size of the new fragment as well as the existing bitstring.
- Use the previously implemented `PaintByNumber.palette_bit_size/1` function to get the bit size of the new fragment.
- Use the special `::bitstring` type to specify that the old fragment is of unknown size.

## 5. Get the first pixel from a picture

- The [bitstring special form][bitstring-form] can be used to [pattern match bitstrings][bitstring-matching].
- Use the previously implemented `PaintByNumber.palette_bit_size/1` function to get the bit size of one pixel.
- Use the special `::bitstring` type to specify that the rest of the bitstring is of unknown size.

## 6. Drop the first pixel from a picture

- The [bitstring special form][bitstring-form] can be used to [pattern match bitstrings][bitstring-matching].
- Use the previously implemented `PaintByNumber.palette_bit_size/1` function to get the bit size of one pixel.
- Use the special `::bitstring` type to specify that the rest of the bitstring is of unknown size.

## 7. Concatenate two pictures

- The [bitstring special form][bitstring-form] can be used to concatenate two bitstrings.
- Use the special `::bitstring` type to specify that each of the bitstring fragments is of unknown size.

[decimal-to-binary-youtube]: https://www.youtube.com/watch?v=gGiEu7QTi68
[integer-literal]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[bitstring]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings
[bitstring-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
[bitstring-matching]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1-binary-bitstring-matching
[type-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#::/2
[integer-pow]: https://hexdocs.pm/elixir/Integer.html#pow/2
