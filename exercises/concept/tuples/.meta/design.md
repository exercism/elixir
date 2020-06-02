## Learning objectives

- Know what a tuple is
- Know how to write a tuple literal
- Know how to return a tuple from a function
- Know that returning a tuple is a common for of multiple return in Elixir
- Know how to extract an element from a tuple using `elem/2`
- Know how to perform a basic pattern match using the `=/2` function
- Know how to perform basic pattern matching on function parameters to guide which function to invoke

## Out of scope

- case do pattern matching

## Prerequisites

- `atoms`: needs to be able to define and use atoms for return values
- `multiple-clause-functions`: need to know that a named function can be overloaded and Elixir will attempt to use them all until one found
- `floating-point-numbers`: need to know how to use floating point numbers to convert

## Concepts

- `tuples` know of the existence of the `tuple` data type, how to define tuple literals, extract values from a tuple using `elem/2`
- `pattern-matching` basic knowledge of pattern matching using `=/2` and on function parameters

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify common conversion functions aren't used from the standard library if they exist.

[analyzer]: https://github.com/exercism/elixir-analyzer
