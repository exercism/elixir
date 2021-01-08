Anonymous functions in Elixir are [closures][closure]. They can access variables that are in scope when the function is defined.

```elixir
a = 7
square = fn -> a * a end
square.()
# => 49
```
