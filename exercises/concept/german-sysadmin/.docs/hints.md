# Hints

## General

- Read about [charlists][getting-started-charlists], [Unicode and code points][getting-started-code-points], and [`case`][getting-started-case] in the official Getting Started guide.
- Read about [charlists][elixirschool-charlists] and [`case`][elixirschool-case] on elixirschool.com.

## 1. Sanitize existing usernames by removing everything but lowercase letters

- Use recursion to iterate over a charlist.
- There is a [built-in function][kernel-case] that allows us to compare a given value against many patterns.
- There is a [special syntax][syntax-reference-code-points] for getting a character's code point. It can be used in guards.
- Charlists are lists of code points, and code points, being numbers, can be [compared][kernel-greater-than] to one another.
- Lowercase Latin letters all have [consecutive code points][unicode-character-reference], in alphabetical order.
- There is [a built-in function][kernel-concat-list] that allows you to concatenate two lists.

## 2. Allow underscores

- There is a [special syntax][syntax-reference-code-points] for getting a character's code point. It can be used in guards and it works for punctuation characters too.
- There is [a built-in function][kernel-concat-list] that allows you to concatenate two lists.

## 3. Substitute German characters

- There is a [special syntax][syntax-reference-code-points] for getting a character's code point. It can be used in guards and it works for non-Latin letters too.
- There is [a built-in function][kernel-concat-list] that allows you to concatenate two lists.

[syntax-reference-code-points]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[getting-started-code-points]: https://hexdocs.pm/elixir/binaries-strings-and-charlists.html#unicode-and-code-points
[getting-started-charlists]: https://hexdocs.pm/elixir/binaries-strings-and-charlists.html#charlists
[getting-started-case]: https://hexdocs.pm/elixir/case-cond-and-if.html#case
[elixirschool-charlists]: https://elixirschool.com/en/lessons/basics/strings/#charlists
[elixirschool-case]: https://elixirschool.com/en/lessons/basics/control-structures/#case
[unicode-character-reference]: https://en.wikibooks.org/wiki/Unicode/Character_reference/0000-0FFF
[kernel-concat-list]: https://hexdocs.pm/elixir/Kernel.html#++/2
[kernel-greater-than]: https://hexdocs.pm/elixir/Kernel.html#%3E/2
[kernel-case]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2
