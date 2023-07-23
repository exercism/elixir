# Introduction

Elixir is a dynamically typed language, which means it doesn't provide compile-time type checks. Still, type specifications can be useful because they:

- Serve as documentation.
- Can be used by static analysis tools like [Dialyzer][dialyzer] to find possible bugs.

A type specification can be added to a function using the `@spec` module attribute right before the function definition.

```elixir
@spec longer_than?(String.t(), non_neg_integer()) :: boolean()
def longer_than?(string, length), do: String.length(string) > length
```

## Types

Expressions allowed in a typespec:

- Basic types, for example:
    - `boolean()`
    - `integer()`, `non_neg_integer()`, `pos_integer()`, `float()`
    - `list()`
    - `map()`
    - `any()`

- A union of types:
    - e.g. `integer() | list(integer())`

- Parameterized types:
    - e.g. `list(integer())` - a list of integers
    - e.g. `%{age: integer()}` - map with an integer value under the key `:age`

- Remote types (defined in some module), for example:
    - [`String.t()`][string-t]
    - [`Enum.t()`][enum-t]
    - [`Range.t()`][range-t]

- Literals, for example:
    - `%{}` - an empty map
    - `[]` - an empty list (but `[any()]` is a non-empty list)
    - e.g. `:ok` - an atom literal

- Built-in specialized types, for example:
    - `char()` - an integer from the range `0..0x10FFFF`
    - `charlist()` - a list of chars
    - `keyword()` - a list of two element tuples, where the first element is an atom

- Custom types

A full list of all types can be found in the ["Typespecs" section in the official documentation][types].

## Naming arguments

Arguments in the typespec could also be named which is useful for distinguishing multiple arguments of the same type.

```elixir
@spec to_hex({hue :: integer, saturation :: integer, lightness :: integer}) :: String.t()
```

## Custom types

Custom types can be defined in using one of the three module attributes:

- `@type` - defines a public type
- `@typep` - defines a private type
- `@opaque` - defines a public type whose structure is private

```elixir
@type color :: {hue :: integer, saturation :: integer, lightness :: integer}

@spec to_hex(color()) :: String.t()
```

## `String.t()` vs `binary()` vs `string()`

[`String.t()`][string-t] is the correct type to use for Elixir strings, which are UTF-8 encoded binaries. Technically, `String.t()` is defined as a `binary()`, and those two types are equivalent to analysis tools, but `String.t()` is the more intention-revealing choice for documenting functions that work with Elixir strings.

On the other hand, `string()` is a different type. It's an Erlang string, in Elixir known as a charlist. The `string()` type should be avoided in typespecs and `charlist()` should be used instead.

## Dialyzer

[Dialyzer][dialyzer] is a static analysis tool that can detect problems such as type errors in Erlang and Elixir code. The easiest way to use Dialyzer in an Elixir project is with [Dialyxir][dialyxir].

[types]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax
[string-t]: https://hexdocs.pm/elixir/String.html#t:t/0
[enum-t]: https://hexdocs.pm/elixir/Enum.html#t:t/0
[range-t]: https://hexdocs.pm/elixir/Range.html#t:t/0
[dialyzer]: https://www.erlang.org/doc/man/dialyzer.html
[dialyxir]: https://hexdocs.pm/dialyxir/readme.html
