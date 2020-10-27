## Learning objectives

After completing this exercise, the student should:

- Know what charlists are and when they are used.
- Know what chars are (code points).
- Know how to use `?` to get a character's code point.
- Know how to use `case` to match a given expression against the given clauses.

## Out of scope

- Changing charlists to strings and strings to charlists.
- Pin operator.
- Ranges.

## Prerequisites

- `lists`
- `recursion`
- `pattern-matching`
- `guards`

## Concepts

- `charlists`
- `case`

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that none of those functions are used: `Kernel.to_string`, anything from the `String` module, anything from the `Regex` module.

[analyzer]: https://github.com/exercism/elixir-analyzer
