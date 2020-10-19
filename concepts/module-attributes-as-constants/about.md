[Module attributes][module-attr] may be used like ["constants"][attr-as-const] which are evaluated at compile-time.

```elixir
defmodule Example do
  @number 2

  def number(), do: @number
end
```

However, they don't strictly behave like constants because they can be overwritten by redefining them in the module:

```elixir
defmodule Example do
  @standard_message "Hello, World!"
  @standard_message "Overwritten!"

  def message(), do: @standard_message
end
```

[module-attr]: https://elixir-lang.org/getting-started/module-attributes.html
[attr-as-const]: https://elixir-lang.org/getting-started/module-attributes.html#as-constants
