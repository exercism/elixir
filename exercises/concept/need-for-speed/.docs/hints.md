# Hints

## General

- Read about [`alias` and `import`][getting-started] in the Getting Started guide.
- Read about [module composition][elixir-school-module-composition] on elixirschool.com.

## 1. Fix compilation error `Race.__struct__/0 is undefined`

- An alias can be created with the [`alias`][alias] special form.

## 2. Fix compilation error `Car.__struct__/0 is undefined`

- An alias can be created with the [`alias`][alias] special form.
- The `alias` special form accepts an `:as` option.

## 3. Fix compilation error `undefined function puts/1`

- Functions can be imported with the [`import`][import] special form.
- The [`import`][import] special form accepts an `:only` option. Its value should be a keyword list with function name as keys and function arities as values.

## 4. Fix compilation error `undefined function default_color/0`

- Functions can be imported with the [`import`][import] special form.
- The [`import`][import] special form accepts an `:except` option. Its value should be a keyword list with function name as keys and function arities as values.


[alias]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#alias/2
[import]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#import/2
[elixir-school-module-composition]: https://elixirschool.com/en/lessons/basics/modules/#composition
[getting-started]: https://elixir-lang.org/getting-started/alias-require-and-import.html
