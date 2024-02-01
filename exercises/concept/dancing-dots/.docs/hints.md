# Hints

## General

- Read about behaviours in the official [Getting Started guide][getting-started-behaviours].
- Read about behaviours on [elixirschool.com][elixir-school-behaviours].
- Read about behaviours in the [documentation][doc-behaviours].
- Read about `use` in the official [Getting Started guide][getting-started-use].
- Read about `use` in the [documentation][doc-use].

## 1. Define the animation behaviour

- Use the `@callback` module attribute to define the desired functions.
- Each callback must specify the function name, list of arguments (their types) and the return value (its type).
- Use the given custom types `dot`, `opts`, `error`, and `frame_number` in the callbacks' definitions.
- Refresh your knowledge of [typespecs][typespec] to help with defining callbacks.

## 2. Provide a default implementation of the `init/1` callback

- Define a `__using__/1` macro in the `DancingDots.Animation` module.
- The macros' argument can be ignored.
- The macro must return a [quoted expression][quote].
- In the quoted expression, use `@behaviour` so that calling `use DancingDots.Animation` sets `DancingDots.Animation` as the using module's behaviour.
- In the quoted expression, implement the `init/1` function.
- The default implementation of the `init/1` function should wrap the given `opts` argument in `:ok` tuple.
- There is [a macro][defoverridable] that can mark a function as overridable.

## 3. Implement the `Flicker` animation

- Make use of `DancingDots.Animation` `__using__/1` macro by calling [this one special macro][doc-use] in the `DancingDots.Flicker` module.
- You do not need to implement the `init/1` function. Its default implementation is enough.
- You need to implement the `handle_frame/3` function.
- To detect "every 4th frame", you can check if the [remainder][rem] when dividing it by 4 is equal to 0.

## 4. Implement the `Zoom` animation

- Make use of `DancingDots.Animation` `__using__/1` macro by calling [this one special macro][doc-use] in the `DancingDots.Zoom` module.
- You need to implement both the `init/1` function and the `handle_frame/3` function.
- Use the [`Keyword`][keyword] module to work with the options keyword list.
- There is [a built-in guard][is_number] for checking if a value is a number.

[getting-started-behaviours]: https://hexdocs.pm/elixir/typespecs.html#behaviours
[doc-behaviours]: https://hexdocs.pm/elixir/typespecs.html#behaviours
[elixir-school-behaviours]: https://elixirschool.com/en/lessons/advanced/behaviours
[doc-use]: https://hexdocs.pm/elixir/Kernel.html#use/2
[getting-started-use]: https://hexdocs.pm/elixir/alias-require-and-import.html#use
[typespec]: https://hexdocs.pm/elixir/typespecs.html
[defoverridable]: https://hexdocs.pm/elixir/Kernel.html#defoverridable/1
[quote]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#quote/2
[rem]: https://hexdocs.pm/elixir/Kernel.html#rem/2
[is_number]: https://hexdocs.pm/elixir/Kernel.html#is_number/1
[keyword]: https://hexdocs.pm/elixir/Keyword.html
