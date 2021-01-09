## Learning objectives

- Know what a map is.
- Know how to define a map literal.
- Know how to put values in a map.
- Know how to get values from a map.
- Know how to update values from a map.
- Know the limitations and guarantees of maps in Elixir.
  - Know that it is not an ordered collection (though appears that way at small sizes)
  - Know that it is O(log n) rather than O(1) as it may be in other languages
- Know how to find and use the Map module functions
- Know how to use the map-update syntax.
- Know how what types can be values and keys (all types).

## Out of scope

- Pattern matching on maps
- Structs
- Structs as maps

## Concepts

- `maps`: See above goals

## Prerequisites

- `lists`
- `tuples`
- `default-arguments`
- `anonymous-functions`: know how to write anonymous functions, pass functions as data

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that a module attribute is used to store the initial score of `0`, and then that module attribute is used in `add_player` and `reset_score`.

[analyzer]: https://github.com/exercism/elixir-analyzer
