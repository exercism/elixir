# Design

The goal of this exercise was to be very explicit and to a lot of hand holding. The previous exercise that taught bitstrings, dna-encoding, had a low completion rate.

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
- `integers`
- `pattern-matching`
- `case`
- `nil`
- `strings`

## Analyzer

- empty bitstring as `<<>>`, not `""` (informative)
- test picture as `<<0::2, 1::2, 2::2, 3::2>>` (allowing for also using `size(2)`) not as `<<27>>`
