# Introduction

Documentation in Elixir is a first-class citizen.

The two module attributes that commonly used to document your code - `@moduledoc` for documenting a module and `@doc` for documenting a function that follows the attribute. The `@moduledoc` attribute usually appears on the first line of the module, and the `@doc` attribute usually appears right before a function definition, or the function's typespec if it has one. The documentation is commonly written in a multiline string using the heredoc syntax.

Elixir documentation is written in [**Markdown**][markdown].

```elixir
defmodule String do
  @moduledoc """
  Strings in Elixir are UTF-8 encoded binaries.
  """

  @doc """
  Converts all characters in the given string to uppercase according to `mode`.

  ## Examples

      iex> String.upcase("abcd")
      "ABCD"

      iex> String.upcase("olá")
      "OLÁ"
  """
  def upcase(string, mode \\ :default)
end
```

[markdown]: https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax
