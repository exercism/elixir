# Design

We assume that the student already knows basic regular expressions. The goal of this exercise is to teach them Elixir-specific details only.

## Learning objectives

- Know about the Regex module
- Know about the `=~` operator
- Know that some String functions accept regular expressions, e.g. match?, replace, split.
- Know about modifiers (e.g. unicode, case-insensitive)
- Know how to get a value from a captured group
- Know that sigils can be used with different delimiters

## Out of scope

- Teaching the syntax of regular expressions
- Compiling Regular expressions with variable content

## Prerequisites

- `strings`
- `lists`
- `pattern-matching`
- `nil`
- `if`

## Concepts

- `regular-expressions`

## Analyzer

- Do not use `String.starts_with?` in this exercise (learn regex instead).
