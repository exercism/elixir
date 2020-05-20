### General

- [Tuples][tuple-module] are data structures which are arranged in contiguous memory and can hold any data-type.
- Atoms may be used to denote finite states, as this exercise uses `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:millilitre` to denote the units used.
- You may use `Kernel` or `Tuple` functions or pattern matching to manipulate to manipulate the tuples.

### 1. Implement the `get_volume/1` function

- Consider using a `Kernel` module function to return the volume-pair's numeric component.
- Remember, one-line functions are best used for short elixir functions.

### 2. Implement the `to_millilitre/1` functions

- Use [multiple clause functions][multi-clause] and pattern matching to reduce conditional control flow logic.

  ```elixir
  defmodule Example do
    def foo(:bar), do: true
    def foo(:baz), do: true
    def foo(_), do: false
  end

  Example.foo(:bar)
  # => true
  Example.foo(:baz)
  # => true
  Example.foo(:blah)
  # => false
  ```

- Implement the function for all units to millilitres, including millilitres to millilitres.

### 3. Implement the `from_millilitre/2` functions

- Use multiple clause functions and pattern matching to reduce conditional control flow logic.
- Implement the function for all units to millilitres, including millilitres to millilitres.

### 4. Implement the `convert/2` function

- Reuse the functions already created to perform the conversion in the `convert/2` function.

[multi-clause]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[tuple-module]: https://hexdocs.pm/elixir/Tuple.html
