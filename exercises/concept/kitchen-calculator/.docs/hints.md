## General

- [Tuples][tuple-module] are data structures which are arranged in contiguous memory and can hold any data-type.
- Atoms may be used to denote finite states, as this exercise uses `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:millilitre` to denote the units used.
- You may use `Kernel` or `Tuple` functions or pattern matching to manipulate to manipulate the tuples.

## 1. Get the numeric component from a volume-pair

- Consider using a `Kernel` module function to return the volume-pair's numeric component.
- Remember, one-line functions are best used for short Elixir functions.

## 2. Convert the volume-pair to millilitres

- Use [multiple clause functions][multi-clause] and [pattern matching][pattern-matching] to reduce conditional control flow logic.
- Implement the function for all units to millilitres, including millilitres to millilitres.

## 3. Convert the millilitre volume-pair to another unit

- Use multiple clause functions and pattern matching to reduce conditional control flow logic.
- Implement the function for all units to millilitres, including millilitres to millilitres.

## 4. Convert from any unit to any unit

- Reuse the functions already created to perform the conversion in the `convert/2` function.

[multi-clause]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[tuple-module]: https://hexdocs.pm/elixir/Tuple.html
[pattern-matching]: https://medium.com/rebirth-delivery/how-to-use-elixir-pattern-matched-functions-arguments-a793733acc6d
