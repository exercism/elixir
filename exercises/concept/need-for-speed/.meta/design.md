# Design

## Learning objectives

- Know how to reference a module by a shorter or a different name with an alias
- Know how to import all functions from a module, but also only a single function

## Out of scope

- `require` (because it needs knowledge of macros)
- `use`

## Concepts

- `alias`
- `import`

## Prerequisites

- `strings`
- `tuples`
- `keyword-lists`
- `enum`
- `structs`
- `io`

## Analyzer

- provide a hint about best practices if `:only` is not used with the `IO` import
- make sure `:except` is used with the `IO.ANSI` import instead of `:only` (reason: the instructions say: "You're planning to add support for other car colors, so you want to import the whole module")
- maybe somehow make sure that the given code wasn't modified, e.g. by looking for the whole `color/1` function?
