Protocols are a mechanism to achieve polymorphism in Elixir when you want behavior to vary depending on the data type.

Protocols are defined using `defprotocol` and contain one or more function header.

```elixir
defprotocol Reversible do
  def reverse(term)
end
```

Protocols can be implemented using `defimpl`.

```elixir
defimpl Reversible, for: List do
  def reverse(term) do
    Enum.reverse(term)
  end
end
```

A protocol can be implemented for any existing Elixir data type or for a struct.

When a protocol function is invoked, the appropriate implementation gets automatically chosen based on the type of the first argument.
