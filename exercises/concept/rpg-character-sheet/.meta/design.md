## Learning objectives

- Know how to write a string to stdio or stderr
- Know how to read a string from stdio
- Know about `IO.inspect` as a debugging technique
- Know about options of `IO.inspect`

## Out of scope

- Reading and writing to files

## Concepts

- `io`

## Prerequisites

- `maps`
- `strings`
- `atoms`

## Analyzer

- The function `welcome` should not explicitly return `:ok`, but implicitly return what `IO.puts` returns (which happens to be `:ok`).
- The function `run` should not reimplement the logic from other functions, but use them.
- The function `run` should not explicitly return the map, but implicitly return what `IO.inspect` returns (which happens to be whatever was its first argument).
- The function `run` should use `IO.inspect` with a `:label` option.
