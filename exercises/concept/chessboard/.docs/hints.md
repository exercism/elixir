# Hints

## General

- Read the official documentation for [ranges][range].

## 1. Define the rank range

- There is a [special operator][range-creation-operator] for creating ranges.

## 2. Define the file range

- There is a [special operator][range-creation-operator] for creating ranges.
- There is a [special syntax][unicode-code-points] to write a character code point without explicitly knowing its value.

## 3. Transform the rank range into a list of ranks

- Ranges implement the `Enumerable` protocol.
- There is a [built-in function][enum-to-list] to change an enumerable data structure to a list.

## 4. Transform the file range into a list of files

- Ranges implement the `Enumerable` protocol.
- There is a [built-in function][enum-map] to change an enumerable data structure to a list while modifying its elements.
- The [bitstring special form][bitstring-special-form] can be used to turn a code point into a string.

[range]: https://hexdocs.pm/elixir/Range.html
[range-creation-operator]: https://hexdocs.pm/elixir/Kernel.html#../2
[unicode-code-points]: https://hexdocs.pm/elixir/syntax-reference.html#integers-in-other-bases-and-unicode-code-points
[enum-to-list]: https://hexdocs.pm/elixir/Enum.html#to_list/1
[enum-map]: https://hexdocs.pm/elixir/Enum.html#map/2
[bitstring-special-form]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
