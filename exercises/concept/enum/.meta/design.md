## Learning objectives

- Know about the `Enum` module.
- Know how to use `Enum.map` and `Enum.reduce`.
- Know about the `Enumerable` protocol.
- Know that maps and lists implement the `Enumerable` protocol.
- Know how to map a map (sic) to another map.
- Know how to pass an existing function as an argument.

## Out of scope

- Capture operator.
- Streams.
- Implementing the `Enumerable` protocol for other data structures.

## Concepts

- `enum`

## Prerequisites

- `lists`
- `maps`
- `atoms`
- `tuples`
- `nil`
- `anonymous-functions`

## Analyzer

- The function `sort_by_price/1` should use `Enum.sort_by`.
- The function `with_missing_price/1` should use `Enum.filter` or `Enum.reject`.
- The function `increase_quantity/2` should use `Enum.map`.
- The function `total_quantity/1` should use `Enum.reduce`.
