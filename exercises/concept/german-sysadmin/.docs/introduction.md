# Introduction

## Charlists

Charlists are created using the `~c` Sigil.

```elixir
~c"hello"
```

~~~~exercism/note
Note that in older versions of Elixir, charlists are represented as `'hello'` with single quotes.
~~~~

Although they look very similar to strings, the two data types are quite different from one another. A charlist is a list of integers. The integers represent the Unicode values of a given character — also known as code points.

```elixir
[65, 66, 67]
# => ~c"ABC"
```

You can prepend a character with `?` to get its code point.

```elixir
?A
# => 65

[?:, ?)]
# => ~c":)"
```

Because charlist are lists, you can work with them just like with any other list - using recursion and pattern matching.

```elixir
[first_letter | _] = ~c"cat"
first_letter
# => 99
```

You can concatenate two lists using `++`.

```elixir
~c"hi" ++ ~c"!"
# => ~c"hi!"
```

The longer the first list is, the slower the concatenation, so avoid repeatedly appending to lists of arbitrary length.

## Case

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
