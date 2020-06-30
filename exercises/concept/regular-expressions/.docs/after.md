Regular expressions are good for matching complex patterns with the use of an expressive pattern syntax. This exercise just scratches the surface of the patterns that regular expressions may represent.

It is not always wise to use regular expressions:

- They must be compiled before use, this takes computation time and memory
- They may be slower than using plain string functions.

```elixir
# Don't use regular expressions to check a suffix:
if "YELLING!" =~ ~r/!$/, do: "Whoa, chill out!"

# Use a string function:
if String.ends_with?("YELLING!", "!"), do: "Whoa, chill out!"
```

Generally, use the `~r` when creating regular expressions, but be aware that regular expressions are generally difficult to read, so add context using well-named variables.

## Review

- Some characters in a regular expression pattern have special meaning, to use the character plainly it must be escaped.
- _Character classes_ allow patterns to match a range of characters
- _Alternations_ allow patterns to match one pattern or another
- _Quantifiers_ allow patterns to match a specified number of repeating patterns
- _Groups_ allow parts of patterns to function as a unit
- _Captures_ allow patterns to return parts of the matched string for further processing

## Resources

- Elixir documentation:
  - [Regex][regex-docs]
  - [Sigils: Regular Expressions][sigils-regex]
- Regular expression resources:
  - [Regular-Expressions.info][website-regex-info]
  - [Rex Egg: The world's most tyrannosauical regex tutorial][website-rexegg]
  - [RegexOne: Learn Regular Expressions with simple, interactive exercises.][website-regexone]
  - [Regular Expressions 101: an online regex sandbox][website-regex-101]
  - [RegExr: an online regex sandbox][website-regexr]
- For fun:
  - [Regex Crossword: a crossword puzzle game][website-regex-crossword]

[regex-docs]: https://hexdocs.pm/elixir/Regex.html
[sigils-regex]: https://elixir-lang.org/getting-started/sigils.html#regular-expressions
[website-regex-info]: https://www.regular-expressions.info
[website-rexegg]: https://www.rexegg.com/
[website-regexone]: https://regexone.com/
[website-regex-101]: https://regex101.com/
[website-regexr]: https://regexr.com/
[website-regex-crossword]: https://regexcrossword.com/
