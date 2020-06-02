## Learning objectives

- Know how write a recursive function.
- Know how to call a recursive function.
- Know how recursion is often used to process lists.

## Out of scope

- Accumulators.
- Tail calls.

## Prerequisites

- `lists`
- `pattern-matching`: necessary for working with lists.
- `multiple-clause-functions`: the preferred way of defining a base case and a recursive step.
- `guards`: the preferred way of implementing conditional recursive steps.

## Concepts

- `recursion`

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that none of those are used:
  - `Enum` module
  - `List` module
  - `Stream` module
  - list comprehensions (`for x <- list`)

[analyzer]: https://github.com/exercism/elixir-analyzer
