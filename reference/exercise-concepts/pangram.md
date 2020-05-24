# Concepts for pangram

## Approach:

### Enum.all?

```elixir
defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    chars =
      sentence
      |> String.downcase()
      |> to_charlist

    Enum.all?(?a..?z, &(&1 in chars))
  end
end
```

## Concepts:

- naming
- modules
- module attributes
  - @doc
    - documentation
  - @spec
    - types
    - String.t()
    - boolean
    - dialyxir
- dynamic typing
- matching
- pipeline operator
- standard library modules
  - Kernel
    - to_charlist/1
    - in/2
  - String
    - downcase/1
  - Enum
  - all?/2
- types
  - string
  - boolean
  - codepoint
    - ? operator
  - lists
    - charlist
  - ranges
  - functions
    - capture syntax
