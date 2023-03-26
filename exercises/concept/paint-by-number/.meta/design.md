# Design

## Learning objectives

- Know what a bitstring is
- Know how to specify a bitstring literal
- Know about the `<<>>` special form
- Know about the `::` binary size modifier
- Know how to construct a bitstring
- know how to pattern match a bitstring

## Out of scope

- binaries
- strings

## Concepts

- `bitstrings`

## Prerequisites

- `recursion`
- `numbers`
- `pattern-matching`
- `case`
- `nil`

## Analyzer

- empty bitstring as `<<>>`, not `""` (informative)
- test painting as ` <<0::2, 1::2, 2::2, 3::2>>` (also using `size(2)`) not as `<<27>>` 
