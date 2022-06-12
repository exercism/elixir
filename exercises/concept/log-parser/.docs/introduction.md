# Introduction

## Regular Expressions

Regular expressions in Elixir follow the **PCRE** specification (**P**erl **C**ompatible **R**egular **E**xpressions), similarly to other popular languages like Java, JavaScript, or Ruby.

The `Regex` module offers functions for working with regular expressions. Some of the `String` module functions accept regular expressions as arguments as well.

~~~~exercism/note
This exercise assumes that you already know regular expression syntax, including character classes, quantifiers, groups, and captures.
~~~~

### Sigils

The most common way to create regular expressions is using the `~r` sigil.

```elixir
~r/test/
```

Note that all Elixir sigils support [different kinds of delimiters][sigils], not only `/`.

### Matching

The `=~/2` can be used to perform a regex match that returns `boolean` result. Alternatively, there are also `match/3` functions in the `Regex` module as well as the `String` module.

```elixir
"this is a test" =~ ~r/test/
# => true

String.match?("Alice has 7 apples", ~r/\d{2}/)
# => false
```

### Capturing

If a simple boolean check is not enough, use the `Regex.run/3` function to get a list of all captures (or `nil` if there was no match). The first element in the returned list is always the whole string, and the following elements are matched groups.

### Modifiers

The behavior of a regular expression can be modified by appending special flags. When using a sigil to create a regular expression, add the modifiers after the second delimiter.

Common modifiers are:
- `i` - makes the match case-insensitive.
- `u` - enables Unicode specific patterns like `\p` snf causes character classes like `\w`, `\s` etc. to also match Unicode.

```elixir
"this is a TEST" =~ ~r/test/i
# => true
```

[sigils]: https://hexdocs.pm/elixir/syntax-reference.html#sigils
