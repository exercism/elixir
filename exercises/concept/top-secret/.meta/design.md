# Design

## Learning objectives

- How to parse a string to AST
- Understanding ASTs
- Traversing ASTs

## Out of scope

- `quote`/`unquote`
- macros

## Concepts

- `ast`

## Prerequisites

- `enum`
- `strings`
- `tuples`
- `pattern-matching`

## Analyzer

- function reuse: `decode_secret_message` should use `decode_secret_message_part` and `to_ast`.
