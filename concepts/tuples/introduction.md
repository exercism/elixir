In Elixir, a tuple is a data structure which organizes data, holding a fixed number of items of any type, but without explicit names for each element. Tuples are often used in Elixir for memory read-intensive operations, since read-access of an element is a constant-time operation. They are not usually used when elements may need to be added/removed dynamically because rather than modifying the existing tuple, a new tuple is created which requires memory to be allocated upfront.

In practice, tuples are created in Elixir using curly braces. Elements in a tuple can be individually accessed using the `elem/1` function using 0-based indexing:

```elixir
empty_tuple = {}
one_element_tuple = {1}
multiple_element_tuple = {1, :a, "hello"}

elem(multiple_element_tuple, 2)
# => "hello"
```

### Tuples as grouped information

Tuples are often used in practice to represent grouped information.

```elixir
Float.ratio(0.25)
# => {1, 4} indicating the numerator and denominator of the fraction ¼
```
