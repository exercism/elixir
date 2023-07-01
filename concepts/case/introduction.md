# Introduction

`case` is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` expression are evaluated from top to bottom, until a match is found.

```elixir
age = 15

case age do
  0 -> ~c"infant"
  age when age < 4 -> ~c"baby"
  age when age < 13 -> ~c"child"
  age when age < 18 -> ~c"teenager"
  _ -> ~c"adult"
end

# => ~c"teenager"
```
