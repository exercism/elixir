## General

- Remember to reference the table in the instructions.

## 1. Given an extension, return the expected media type

- Use [pattern matching][pattern-matching] to return the correct media type.
- You can use [multiple function clauses][mfc].

## 2. Given a binary file, return the expected media type

- Use the [binary special form][special-forms] available to you for writing a binary literal.
- Use [pattern matching][binary-matching] to match against the first few bytes of the file binary.

## 3. Given an extension and a binary file, verify that the file matches the expected type

- Reuse the functions you created for parts 1 and 2.
- Compare the return value of each function, then return the appropriate value.
  - You can use the [`if` macro conditional][if] for binary conditions.

[binary-matching]: https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#binaries
[if]: https://elixir-lang.org/getting-started/case-cond-and-if.html#if-and-unless
[mfc]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[mimetype]: https://en.wikipedia.org/wiki/Media_type
[pattern-matching]: https://elixir-lang.org/getting-started/pattern-matching.html#pattern-matching-1
[special-forms]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
