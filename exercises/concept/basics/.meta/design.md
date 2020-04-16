# Design

## Goal

The goal of this exercise is to teach the student the basics of programming in Elixir.

## Learning objectives

- Know what a variable is.
- Know how to define a variable.
- Know how to update a variable.
- Know that variable type is dynamic.
- Know how to define a multi-line function.
- Know how to return a value from a function (implicit return).
- Know how to call a function.
- Know that functions must be defined in classes.
- Know about the `def` access modifier.
- Know how to define an integer.
- Know how to use mathematical operators on integers.
- Know how to define single-line comments.

## Out of scope

- Naming rules for identifiers.
- Generic values.
- Memory and performance characteristics.
- Function overloads.
- Anonymous functions.
- Default parameters.
- Organizing functions in namespaces.
- Visibility (`defp`).
- Single-line functions
- `@moduledoc` and `@doc` multi-line comments

## Concepts

The Concepts this exercise unlocks are:

- `basics`: know what a variable is; know how to define a variable; know how to update a variable; know how to use type inference for variables; know how to define a function; know how to return a value from a function; know how to call a function; know that functions must be defined in classes; know about the `public` access modifier; know how to define an integer; know how to use mathematical operators on integers; know how to define single-line comments.

## Prequisites

There are no prerequisites.

## Representer

This exercise does not require any specific representation logic to be added to the [representer][representer].

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that the `remaining_minutes_in_oven/1` function calls the `expected_minutes_in_oven/0` function.
- Verify that the `total_time_in_minutes/2` function calls the `preparation_time_in_minutes/1` function.

[analyzer]: https://github.com/exercism/elixir-analyzer
[representer]: https://github.com/exercism/elixir-representer
