# Design

This exercise should provide a boilerplate with already implemented functions that only need a doc and typespec. The functions should be simple so that the exercise can appear early in the concept tree, e.g. do not use `Enum`.

## Learning objectives

- `@moduledoc`
- `@doc`
- `@spec`
- defining union types with `|`
- defining your own type with `@type`
- naming arguments in a typespec
- the difference between `String.t()` and `string()`
- using atom literals in the typespec is a typical pattern (e.g. `{:ok, any()} | {:error, any()}`)

## Out of scope

Anything that would put this exercise at the end of the concept tree or is not practical for everyday usage, so for example:
- `pid()`, `reference()` types
- `@callback`
- improper lists
- structs
- behaviours

## Prerequisites

- `integers`
- `tuples`
- `lists`
- `strings`
- `maps`
- `multiple-clause-functions`

## Concepts

- `docs`
- `typespecs`
