## Learning objectives

- Know what a variable is.
- Know how to define a named function.
- Know how to define a function with parameters.
- Know how to return a value from a function.
- Know what a boolean is.
- Know how to use logical operators on booleans.
  - `and/2`, `or/2`, `not/1`
- Know how to name functions that return boolean values.

## Out of scope

- Default parameters.
- Truthy logical comparisons using `&&/2`, `||/2`, `!/1`
- Single-line functions
- Booleans as special atoms
- `is_` prefix naming for boolean guard functions

## Prerequisites

- `basics`: needs to be able to define named functions, return values

## Concepts

- `booleans` know of the existence of the `boolean` type and its two values, boolean operators, and how to build boolean logical expressions, and know boolean operator precedence rules.

## Analyzer

This exercise could benefit from the following rules added to the the [analyzer][analyzer]:

- Verify that the functions use `and/2`, `or/2`, `not/1` rather than `&&/2`, `||/2`, `!/1`

[analyzer]: https://github.com/exercism/elixir-analyzer

## References

1. Jui-Feng Weng, Shian-Shyong Tseng, Tsung-Ju Lee, Teaching Boolean Logic through Game Rule Tuning, IEEE Trans. Learning Technol. 3 (2010) 319–328. <https://doi.org/10.1109/TLT.2010.33>.
