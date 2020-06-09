## Learning objectives

- Know what a bitstring is
- Know how to specify a bitstring literal
- Know about the `<<>>` special form
- Know about the `::` binary size modifier
- Know how to construct a bitstring
- know how to pattern match a bitstring
- learn about accumulators and TCO

## Out of scope

- binaries
- strings

## Concepts

- `bitstrings`
- `tail-recursion`

## Prerequisites

- `recursion`
- `charlists`
- `pattern-matching`

## Analyzer

- Possibly check for use of `Enum.reduce` to build the bitstring.
- Check for use of list comprehensions rather than recursive functions.
