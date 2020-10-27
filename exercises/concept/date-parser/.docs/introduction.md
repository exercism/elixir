Regular expressions (regex) are a powerful tool for working with strings in Elixir. Regular expressions in Elixir follow the **PCRE** specification (**P**erl **C**ompatible **R**egular **E**xpressions). String patterns representing the regular expression's meaning are first compiled then used for matching all or part of a string.

In Elixir, the most common way to create regular expressions is using the `~r` sigil. Sigils provide _syntactic sugar_ shortcuts for common tasks in Elixir. To match a _string literal_, we can use the string itself as a pattern following the sigil.

```elixir
~r/test/
```

The `=~/2` operator is useful to perform a regex match on a string to return a `boolean` result.

```elixir
"this is a test" =~ ~r/test/
# => true
```

> Two notes about using sigils:
>
> - many different delimiters may be used depending on your requirements rather than `/`
> - string patterns are already _escaped_, when writing the pattern as a string not using a regex, you will have to _escape_ backslashes (`\`)

Matching a range of characters using square brackets `[]` to denote a _character class_. This will match any one character to the characters in the class. You can also specify a range of characters like `a-z`, as long as the start and end represent a contiguous range of codepoints.

```elixir
regex = ~r/[a-z][AZ][0-9][!?]/
"jZ5!" =~ regex
# => true
"jB5?" =~ regex
# => false
```

_Shorthand character classes_ which make the pattern more concise. A small selection:

- `\d` short for `[0-9]` (any digit)
- `\w` short for `[A-Za-z0-9_]` (any 'word' character)
- `\s` short for `[ \t\r\n\f]` (any whitespace character)

> Note: when a _shorthand character class_ outside of a sigil, it must be escaped: `"\\d"`

_Alternations_ use `|` as a special character to denote matching one _or_ another

```elixir
regex = ~r/cat|bat/
"bat" =~ regex
# => true
"cat" =~ regex
# => true
```

_Quantifiers_ allow a for a repeating pattern in the regex. They affect the group preceding the quantifier.

- `{N, M}` where `N` is the minimum number of repetitions, and `M` is the maximum
- `{N,}` match `N` or more repetitions
  - `{0,}` may also be written as `*`: match zero-or-more repetitions
  - `{1,}` may also be written as `+`: match one-or-more repetitions
- `{,N}` match up to `N` repetitions

Round brackets `()` are used to denote _groups_ and _captures_. The group may also be _captured_ in some instances to be returned for use. In Elixir, these may be named or un-named. Captures are named by appending `?<name>` after the opening parenthesis. Groups function as a single unit, like when followed by _quantifiers_.

```elixir
regex = ~r/(h)at/
Regex.replace(regex, "hat", "\\1op")
# => "hop"

regex = ~r/(?<letter_b>b)/
Regex.scan(regex, "blueberry", capture: :all_names)
# => [["b"], ["b"]]
```

_Anchors_ are used to tie the regular expression to the beginning or end of the string to be matched:

- `^` anchors to the beginning of the string
- `$` anchors to the end of the string

Because the `~r` is a shortcut for `"pattern" |> Regex.escape() |> Regex.compile!()`, you may also use string interpolation to dynamically build a regular expression pattern:

```elixir
anchor = "$"
regex = ~r/end of the line#{anchor}/
"end of the line?" =~ regex
# => false
"end of the line" =~ regex
# => true
```
