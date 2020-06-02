Charlists are created using single quotes.

```elixir
'hello'
```

A charlist is a list of integers. The integers represent the Unicode values of a given character — also known as code points.

```elixir
[65, 66, 67]
# => 'ABC'
```

## Charlists _are_ lists

```elixir
'' === []
# => true

is_list('hello')
# => true
```

Because charlist are lists, you can work with them just like with any other list - using recursion and pattern matching, or using the [`List`][list] module.

```elixir
[first_letter | _] = 'cat'
first_letter
# => 99

List.first('hello')
# => 104
List.pop_at('hello', 0)
# => {104, 'ello'}

```

You can concatenate two lists together using [`++`][kernel-concat-list].

```elixir
'hi' ++ '!'
# => 'hi!'
```

The longer the first list is, the slower the concatenation, so avoid repeatedly appending to lists of arbitrary length.

## Printability

If a list of integers contains only integers that are code points of printable character, it will be displayed as a charlist. Even if it was defined using the `[]` syntax.

```elixir
'ABC'
# => 'ABC'

[65, 66, 67]
# => 'ABC'
```

If a list of integers contains even one code point of an unprintable character (e.g. `0-6`, `14-26`, `28-31`), it will be displayed as a list. Even if it was defined using the`''` syntax.

```elixir
'ABC\0'
# => [65, 66, 67, 0]

[65, 66, 67, 0]
# => [65, 66, 67, 0]
```

Printability can be checked with [`List.ascii_printable?`].

```elixir
List.ascii_printable?([65, 66, 67])
# => true
List.ascii_printable?([65, 66, 67, 0])
# => false
```

Keep in mind that those are two different ways of _displaying_ the same data. The values are strictly equal.

```elixir
'ABC' === [65, 66, 67]
# => true
```

When printing a list with [`IO.inspect`][io-inspect], you can use the [`:charlists`][inspect-opts] option to control how lists are printed.

```elixir
IO.inspect('ABC', charlists: :as_charlists)
# => prints 'ABC'

IO.inspect('ABC', charlists: :as_lists)
# => prints [65, 66, 67]
```

## Code points

You can prepend a character with `?` to get its code point.

```elixir
?A
# => 65

[?:, ?)]
# => ':)'
```

## Charlists vs strings

Charlists and strings consisting of the same characters are not considered equal.

```elixir
'hello' == "hello"
false
```

Each value in a charlist is the [Unicode code point of a character][unicode-table] whereas in a string, the codepoints are encoded as [UTF-8][utf8].

```elixir
IO.inspect('tschüss', charlists: :as_lists)
# => prints [116, 115, 99, 104, 252, 115, 115]

IO.inspect("tschüss", binaries: :as_binaries)
# => prints <<116, 115, 99, 104, 195, 188, 115, 115>>
```

Note how `ü`, code point `252`, is encoded in UTF-8 as `195` and `188`.

**In practice, charlists are rarely used**. Their main use case is interfacing with Erlang, in particular when using older libraries that do not accept binaries as arguments.

When working with Elixir, **use strings to store text**. The `String` module offers a wide choice of functions to process text, functions not available for charlists.

Charlists can be converted to strings with [`to_string`][kernel-to-string].

```elixir
to_string('hello')
# => "hello"
```

## `case`

`case` is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` statement are evaluated from top to bottom, until a match is found.

In many cases, using `case` is interchangeable with defining multiple function clauses.

```elixir
# one function clause, multiple case clauses
def age_group(age) do
  case age do
    0 -> 'infant'
    age when age < 4 -> 'baby'
    age when age < 13 -> 'child'
    age when age < 18 -> 'teenager'
    _ -> 'adult'
  end
end

# multiple function clauses, no case
def age_group(0), do: 'infant'
def age_group(age) when age < 4, do: 'baby'
def age_group(age) when age < 13, do: 'child'
def age_group(age) when age < 18, do: 'teenager'
def age_group(_), do: 'adult'
```

There are no strict rules for choosing one over the other. It's a matter of personal preference that usually depends on context.

[list]: https://hexdocs.pm/elixir/List.html
[list-ascii-printable]: https://hexdocs.pm/elixir/List.html#ascii_printable?/2
[inspect-opts]: https://hexdocs.pm/elixir/Inspect.Opts.html
[io-inspect]: https://hexdocs.pm/elixir/IO.html#inspect/2
[kernel-concat-list]: https://hexdocs.pm/elixir/Kernel.html#++/2
[typespecs-built-in-types]: https://hexdocs.pm/elixir/typespecs.html#built-in-types
[string]: https://hexdocs.pm/elixir/String.html#functions
[kernel-to-string]: https://hexdocs.pm/elixir/Kernel.html#to_string/1
[unicode-table]: https://unicode-table.com/en/
[utf8]: https://www.fileformat.info/info/unicode/utf8.htm
