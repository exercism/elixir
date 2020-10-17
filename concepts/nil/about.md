[Nil][nil-dictionary] is an English word meaning "nothing" or "zero". In Elixir, `nil` is a special value that means an _absence_ of a value.

```elixir
# I do not have a favorite color
favorite_color = nil
```

`nil` is an atom, but it is usually written as `nil`, not `:nil`. The boolean values `true` and `false` are atoms too.

```elixir
nil === :nil
# => true

true === :true
# => true
```

You can check if a variable's value is `nil` using [`==`][kernel-equal], with pattern matching, or using the [`is_nil` guard][kernel-is-nil].

```elixir
def call(phone_number) do
  if phone_number == nil do
    :error
  end
end
```

```elixir
def call(phone_number) when is_nil(phone_number) do
  :error
end
```

```elixir
def call(nil) do
  :error
end
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
[kernel-is-nil]: https://hexdocs.pm/elixir/Kernel.html#is_nil/1
[kernel-equal]: https://hexdocs.pm/elixir/Kernel.html#==/2
