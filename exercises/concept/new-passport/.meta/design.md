# Design

This exercise should provide a boilerplate with already implemented functions returning `{:ok, any} | {:error, String.t()}` that will be combined in the main function to deal with the multiple possible errors.

## Learning objectives

- use `with` syntax
- catch a specific error with `else`

## Out of scope

- guard patterns
- realize you don't always need `else`

## Prerequisites

- `atoms`
- `cond`
- `tuples`
- `strings`
- `pattern-matching`
- `multiple-clause-functions`
- `guards`
- `errors`
- `dates-and-time`

## Concepts

- `with`

## Analyzer

- make sure that `with` is used
- make sure that `case` is not used
- make sure that `=` is used within the `with` chain (using `_block_includes`)
- make sure the functions below were not touched
