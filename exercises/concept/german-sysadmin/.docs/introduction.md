## charlists

Charlists are created using single quotes.

```elixir
'hello'
```

Although they look similar to strings, the two data types are quite different from one another. A charlist is a list of integers. The integers represent the Unicode values of a given character — also known as code points.

```elixir
[65, 66, 67]
# => 'ABC'
```

You can prepend a character with `?` to get its code point.

```elixir
?A
# => 65

[?:, ?)]
# => ':)'
```

Because charlist are lists, you can work with them just like with any other list - using recursion and pattern matching.

```elixir
[first_letter | _] = 'cat'
first_letter
# => 99
```

You can concatenate two lists using `++`.

```elixir
'hi' ++ '!'
# => 'hi!'
```

The longer the first list is, the slower the concatenation, so avoid repeatedly appending to lists of arbitrary length.

## case

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
