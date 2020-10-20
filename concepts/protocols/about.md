Protocols are:

- a mechanism to achieve polymorphism.
- defined with `defprotocol`[defprotocol].
- implemented for a specific data type with `defimpl`[defimpl].

A big strength of protocols is that the implementation of a protocol for a specific data type doesn't need to be bundled with the data type's definition or the protocol's definition. This allows for writing libraries that can be easily extended by their users to work with the users' custom data types, without having to modify the library.

## Implementing

It is possible to implement protocols for all Elixir types: structs, `Tuple`, `Atom`, `List`, `BitString`, `Integer`, `Float`, `Function`, `PID`, `Map`, `Port`, `Reference`, and `Any`.

Protocols can be implemented for multiple types at once:

```elixir
defimpl Reversible, for: [Map, List] do
  def reverse(term) do
    Enum.reverse(term)
  end
end
```

When implementing a protocol for a struct directly inside a module that defines the struct, the `:for` argument can be omitted:

```elixir
defmodule ShoppingCart do
  defstruct [:items]

  defimpl Reversible do
    def reverse(shopping_cart) do
      Enum.reverse(shopping_cart)
    end
  end
end
```

## Fallback to `Any`

By default, invoking a protocol for a data type for which it wasn't implemented will raise a `Protocol.UndefinedError` error:

```elixir
to_string({})
# => ** (Protocol.UndefinedError) protocol String.Chars not implemented for {} of type Tuple
#        (elixir 1.10.3) lib/string/chars.ex:3: String.Chars.impl_for!/1
#        (elixir 1.10.3) lib/string/chars.ex:22: String.Chars.to_string/1
```

It is possible to avoid that by providing a fallback implementation that would be used in such a case. To do that, set the `@fallback_to_any` module attribute to `true` when defining the protocol and write an implementation for the `Any` type:

```elixir
defprotocol Reversible do
  @fallback_to_any true
  def reverse(term)
end

defimpl Reversible, for: Any do
  def reverse(term) do
    term
  end
end
```

Note that in most cases, raising an error is the preferable approach because it's difficult to make a reasonable assumption about a protocol for _all_ data types.

## Note-worthy built-in protocols

- [`Enumerable`][enumerable] - the functions from the `Enum` and `Stream` modules work with data types implementing this protocol.
- [`Collectable`][collectable] - the [`Enum.into/2`][enum-into] function uses this protocol to insert an enumerable into a collection.
- [`Inspect`][inspect] - you can implement this protocol to change how [`Kernel.inspect/2`][kernel-inspect] represents a specific data type as a string.
- [`String.Chars`][string-chars] - you can implement this protocol to change how [`Kernel.to_string/1`][kernel-to-string] represents a specific data type as a string.

[defprotocol]: https://hexdocs.pm/elixir/Kernel.html#defprotocol/2
[defimpl]: https://hexdocs.pm/elixir/Kernel.html#defimpl/3
[collectable]: https://hexdocs.pm/elixir/Collectable.html
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
[inspect]: https://hexdocs.pm/elixir/Inspect.html
[string-chars]: https://hexdocs.pm/elixir/String.Chars.html
[enum]: https://hexdocs.pm/elixir/Enum.html
[stream]: https://hexdocs.pm/elixir/Stream.html
[enum-into]: https://hexdocs.pm/elixir/Enum.html#into/2
[kernel-inspect]: https://hexdocs.pm/elixir/Kernel.html#inspect/2
[kernel-to-string]: https://hexdocs.pm/elixir/Kernel.html#to_string/1
