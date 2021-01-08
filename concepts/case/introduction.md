`case` is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` statement are evaluated from top to bottom, until a match is found.

```elixir
age = 15

case age do
  0 -> 'infant'
  age when age < 4 -> 'baby'
  age when age < 13 -> 'child'
  age when age < 18 -> 'teenager'
  _ -> 'adult'
end

# => 'teenager'
```
