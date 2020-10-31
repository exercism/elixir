## Learning objectives

- Know of the existence of the `list` type.
- Know how list can be constructed with `[]` and `[ head | tail ]` syntax
- Use basic functions and macros related to Lists.
  - `hd/1`
  - `tl/1`
  - `length/1`
  - `in/2`
- Learn about string literals

## Out of scope

- Pattern matching
- `Enum` module functions / behaviors
- `String` functions and string manipulation
- Iterate over a list
- Memory and performance characteristics.

## Concepts

- `lists`
  - know of the existence of the `list` type;
  - know of the idea of `list` design;
  - know some basic patterns / functions
    - like `[]`, `[_|_]`, `hd/1`, `tl/1`, `length/1`, `in/2`
- `string-literals`
  - not a standalone concept, captured in `basics`
  - know how to write out a string with double quotes

## Prerequisites

- `booleans`
  - know how to return booleans values from a function
  - know of the naming convention for functions that return strict boolean values

## Analyzer

This exercise does not require any specific logic to be added to the [analyzer][analyzer].

It may benefit from additions which ensure the use of the `hd/1`, `tl/1`, `length/1` functions and `in/2` macro.

## Resources

- Elixir documentation: [Lists][hexdocs-lists]
- Getting started tutorial: [Lists][getting-started-lists]

[analyzer]: https://github.com/exercism/csharp-analyzer
[hexdocs-lists]: https://hexdocs.pm/elixir/List.html
[getting-started-lists]: https://elixir-lang.org/getting-started/basic-types.html#linked-lists
