# Hints

## General

- Read the official documentation for [typespecs][typespecs].
- Read the official documentation about [writing documentation][writing-documentation].
- Read about using module attributes as annotations in the [official Getting Started guide][getting-started-module-attributes].
- Read about using typespecs in the [official Getting Started guide][getting-started-typespecs].

## 1. Document the purpose of the form tools

- The module attribute `@moduledoc` can be used to write documentation for a module.

## 2. Document filling out fields with blank values

- The module attribute `@doc` can be used to write documentation for a function.
- The module attribute `@spec` can be used to write a typespec for a function.
- Place the `@doc` and `@spec` attributes right before the first function clause of the function that those attributes describe.
- Refer to the [typespecs documentation][typespecs-types] for a list of all available types.
- The correct type for strings is [defined in the `String` module][string-t].

## 3. Document splitting values into lists of uppercase letters

- The module attribute `@doc` can be used to write documentation for a function.
- The module attribute `@spec` can be used to write a typespec for a function.
- Place the `@doc` and `@spec` attributes right before the first function clause of the function that those attributes describe.
- Refer to the [typespecs documentation][typespecs-types] for a list of all available types.
- The correct type for strings is [defined in the `String` module][string-t].
- A list is a parametrized type.

## 4. Document checking if a value fits a field with a max length

- The module attribute `@doc` can be used to write documentation for a function.
- The module attribute `@spec` can be used to write a typespec for a function.
- Place the `@doc` and `@spec` attributes right before the first function clause of the function that those attributes describe.
- Refer to the [typespecs documentation][typespecs-types] for a list of all available types.
- The correct type for strings is [defined in the `String` module][string-t].
- Literal values can be used in a typespec.
- The pipe `|` can be used to represent a union of types.

## 5. Document different address formats

- The module attribute `@type` can be use to define a custom public type.
- Types can be compound, e.g. when specifying a type that's a map, you can also specify the types of the values under the specific keys.
- [The type operator `::`][type-operator] can also be used to prepend a variable name to a type.
- Custom types can be used to define other custom types.

## 6. Document formatting the address

- The module attribute `@doc` can be used to write documentation for a function.
- The module attribute `@spec` can be used to write a typespec for a function.
- Place the `@doc` and `@spec` attributes right before the first function clause of the function that those attributes describe.
- Refer to the [typespecs documentation][typespecs-types] for a list of all available types.
- The correct type for strings is [defined in the `String` module][string-t].
- Custom types can be used in a typespec.

[writing-documentation]: https://hexdocs.pm/elixir/writing-documentation.html
[typespecs]: https://hexdocs.pm/elixir/typespecs.html
[typespecs-types]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax
[getting-started-module-attributes]: https://hexdocs.pm/elixir/module-attributes.html#as-annotations
[getting-started-typespecs]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax
[string-t]: https://hexdocs.pm/elixir/String.html#t:t/0
[type-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#::/2
