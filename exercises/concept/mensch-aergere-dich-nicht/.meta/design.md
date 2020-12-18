## Learning objectives

- Know about the `|>` pipe operator for chaining function calls.
- Know about streams.
  - `Enum` functions are eager, `Stream` functions are lazy.
  - Potentially infinite.
  - When to use streams instead of `Enum`.

## Out of scope

## Concepts

- `streams`
- `pipe-operator`

## Prerequisites

- `enum`
- `tuples`
- `if`
- `ranges`
- `randomness`

## Analyzer

- The function `d6` should use a range and `Enum` functions, it should not use `:rand`.
- The function `roll` should capture the existing `d6` function with `&d6/0`.
