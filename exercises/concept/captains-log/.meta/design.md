## Learning objectives

- Know how to call an Erlang function
- Know to use Erlang functions for random floats, formatting a float, math, sleep
- Know how to generate a random integer, float, letter
- Know that Enum.random with a range doesn't traverse the whole range

## Out of scope

- ETS

## Prerequisites

- `enum`
- `ranges`
- `floating-point-numbers`
- `atoms`
- `strings`
- `charlists`

## Concepts

- `erlang-libraries`
- `randomness`

## Analyzer

- check that `random_planet_class` and `random_ship_registry_number` use `Enum.random`
- check that `random_stardate` uses `:rand.uniform` and does not use `Enum.random`
- check that `format_stardate` uses `:io_lib`
