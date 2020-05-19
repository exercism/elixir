# Design

## Goal

The goal of this exercise is to teach the student how strings are implemented and used in Elixir.

## Learning objectives

After completing this exercise, the student should:

- Know how to concatenate strings.
- Know how to manipulate strings.
- Know how to perform string interpolation.
- Know how to create multiline strings (heredocs).

## Out of scope

- Strings as binaries for binary pattern matching.
- Regular expressions.
- Sigils.
- Charlists.
- Graphemes and the difference between `byte_size` and `String.length`.

## Prerequisites

This exercise's prerequisites are:

- `lists`: needs to be able to work with the return value of `String.split`.
- `basic-pattern-matching`: needs to be able to work with the return value of `String.split`.

## Concepts

The concepts this exercise unlocks are:

- `strings`: knows how to concatenate strings, interpolate expressions inside of strings, create multiline strings, and modify strings using the _String module_.

## Representer

This exercise does not require any specific representation logic to be added to the [representer][representer].

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that the `initial/1` function calls the `first_letter/1` function.
- Verify that the `initials/1` function calls the `initial/1` function.
- Verify that the `pair/1` function calls the `initials/1` function and uses `"""` to create the string.

[analyzer]: https://github.com/exercism/elixir-analyzer
[representer]: https://github.com/exercism/elixir-representer
