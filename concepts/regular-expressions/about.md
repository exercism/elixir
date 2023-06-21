# About

Regular expressions (regex) are a powerful tool for working with strings in Elixir. Regular expressions in Elixir follow the **PCRE** specification (**P**erl **C**ompatible **R**egular **E**xpressions). String patterns representing the regular expression's meaning are first compiled then used for matching all or part of a string.

In Elixir, the most common way to create regular expressions is using [the `~r` sigil][sigils-regex]. Sigils provide _syntactic sugar_ shortcuts for common tasks in Elixir. In this case, `~r` is a shortcut for using [`Regex.compile!/2`][regex-compile].

```elixir
Regex.compile!("test") == ~r/test/
# => true
```

The [`=~/2`][regex-match-operator] operator is useful to perform a regex match on a string to return a `boolean` result.

```elixir
"this is a test" =~ ~r/test/
# => true
```

## Regex syntax review

- Some characters in a regular expression pattern have special meaning, to use the character plainly it must be escaped with `\`, e.g. `~r/\?/`.
- _Character classes_ (e.g. `\d`, `\w`) allow patterns to match a range of characters
- _Alternations_ (`|`) allow patterns to match one pattern or another
- _Quantifiers_ (`{N, M}`, `*`, `?`) allow patterns to match a specified number of repeating patterns
- _Groups_ (`()`) allow parts of patterns to function as a unit

## Captures

Regular expressions are also useful for extracting a portion of a string. This is called _capturing_. To _capture_ a part of a string, create a group (`()`) for the part that you want to capture and use [`Regex.run`][regex-run].

```elixir
Regex.run(~r/Weight: (\d*)g/, "Weight: 150g")
# => ["Weight: 150g", "150"]
```

Captures are numbered (starting at 1) and can also be used in the result when replacing parts of a string with a regular expression:

```elixir
Regex.replace(~r/Weight: (\d*)g/, "Weight: 150g", "Gewicht: \\1g")
# => "Gewicht: 150g"
```

Captures can also be named by appending `?<name>` after the opening parenthesis. Use [`Regex.named_captures/3`][regex-named-captures] to get a map with named captures.

```elixir
Regex.named_captures(~r/Weight: (?<weight>\d*)g/, "Weight: 150g")
# => %{"weight" => "150"}
```

## Modifiers

The behavior of a regular expression can be modified by appending special flags at the end of the regular expression, e.g. `~r/test/i`.

- `caseless` `i` - case insensitive
  ```elixir
  "A" =~ ~r/a/
  # => false
  "A" =~ ~r/a/i
  # => true
  ```
- `unicode` `u` - enables Unicode specific patterns like `\p` and causes character classes like `\w` etc. to also match on Unicode
  ```elixir
  "ö" =~ ~r/^\w$/
  # => false
  "ö" =~ ~r/^\w$/u
  # => true
  ```
- [And more: `dotall`, `multiline`, `extended`, `firstline`, `ungreedy`][regex-modifiers]

## Dynamically building regular expressions

Because the `~r` sigil is a shortcut for `"pattern" |> Regex.escape() |> Regex.compile!()`, you may also use string interpolation to dynamically build a regular expression pattern:

```elixir
anchor = "$"
regex = ~r/end of the line#{anchor}/
"end of the line?" =~ regex
# => false
"end of the line" =~ regex
# => true
```

## Regular expressions vs the `String` module

Although regular expressions are powerful, it is not always wise to them:

- They must be compiled before use, this takes computation time and memory.
- They may be slower than using plain string functions.

As a rule of thumb, it is better to use the [functions from the `String` module][string-functions] whenever possible.

```elixir
# Don't use regular expressions to check a suffix:
if "YELLING!" =~ ~r/!$/, do: "Whoa, chill out!"

# Use a string function:
if String.ends_with?("YELLING!", "!"), do: "Whoa, chill out!"
```

[sigils-regex]: https://elixir-lang.org/getting-started/sigils.html#regular-expressions
[string-functions]: https://hexdocs.pm/elixir/String.html#functions
[regex-modifiers]: https://hexdocs.pm/elixir/Regex.html#module-modifiers
[regex-character-classes]: https://hexdocs.pm/elixir/Regex.html#module-character-classes
[regex-run]: https://hexdocs.pm/elixir/Regex.html#run/3
[regex-named-captures]: https://hexdocs.pm/elixir/Regex.html#named_captures/3
[regex-match-operator]: https://hexdocs.pm/elixir/Kernel.html#=~/2
[regex-compile]: https://hexdocs.pm/elixir/Regex.html#compile!/2
