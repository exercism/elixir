# Introduction

## Docs

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

## Typespecs

Elixir is a dynamically typed language, which means it doesn't provide compile-time type checks. Still, type specifications can be used as a form of documentation.

A type specification can be added to a function using the `@spec` module attribute right before the function definition. `@spec` is followed by the function name and a list of all of its arguments' types, in parentheses, separated by commas. The type of the return value is separated from the function's arguments with a double colon `::`.

```elixir
@spec longer_than?(String.t(), non_neg_integer()) :: boolean()
def longer_than?(string, length), do: String.length(string) > length
```

### Types

Most commonly used types include:

- booleans: `boolean()`
- strings: `String.t()`
- numbers: `integer()`, `non_neg_integer()`, `pos_integer()`, `float()`
- lists: `list()`
- a value of any type: `any()`

Some types can also be parameterized, for example `list(integer)` is a list of integers.

Literal values can also be used as types.

A union of types can be written using the pipe `|`. For example, `integer() | :error` means either an integer or the atom literal `:error`.

A full list of all types can be found in the ["Typespecs" section in the official documentation][types].

### Naming arguments

Arguments in the typespec could also be named which is useful for distinguishing multiple arguments of the same type. The argument name, followed by a double colon, goes before the argument's type.

```elixir
@spec to_hex({hue :: integer, saturation :: integer, lightness :: integer}) :: String.t()
```

### Custom types

Typespecs aren't limited to just the built-in types. Custom types can be defined using the `@type` module attribute. A custom type definition starts with the type's name, followed by a double colon and then the type itself.

```elixir
@type color :: {hue :: integer, saturation :: integer, lightness :: integer}

@spec to_hex(color()) :: String.t()
```

A custom type can be used from the same module where it's defined, or from another module.

[types]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax
[markdown]: https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax
