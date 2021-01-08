In Elixir, we can define module attributes which can be used as constants in our functions.

```elixir
defmodule Example do

  # Defines the attribute as the value 1
  @constant_number 1

  def example_value() do
    # Returns the value 2
    @constant_number
  end
end
```

When used to define module constants, attributes can be any expression which can be evaluated at compilation time. After compilation, module attributes are not accessible since they are expanded during compilation, similar to defined macros in languages like C.
