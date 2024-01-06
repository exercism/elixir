# Hints

## General

- Review regular expression patterns from the introduction. Remember, when creating the pattern a string, you must escape some characters.
- Read about the [`Regex` module][regex-docs] in the documentation.
- Read about the [regular expression sigil][sigils-regex] in the Getting Started guide.
- Check out this website about regular expressions: [Regular-Expressions.info][website-regex-info].
- Check out this website about regular expressions: [Rex Egg - The world's most tyrannosauical regex tutorial][website-rexegg].
- Check out this website about regular expressions: [RegexOne - Learn Regular Expressions with simple, interactive exercises][website-regexone].
- Check out this website about regular expressions: [Regular Expressions 101 - an online regex sandbox][website-regex-101].
- Check out this website about regular expressions: [RegExr - an online regex sandbox][website-regexr].

## 1. Identify garbled log lines

- Use the [`r` sigil][sigil-r] to create a regular expression.
- There is [an operator][match-operator] that can be used to check a string against a regular expression. There is also a [`Regex` function][regex-match] and a [`String` function][string-match] that can do the same.
- Don't forget to escape characters that have special meaning in regular expressions.

## 2. Split the log line

- There is a [`Regex` function][regex-split] as well as a [`String` function][string-split] that can split a string into a list of strings based on a regular expression.
- Don't forget to escape characters that have special meaning in regular expressions.

## 3. Remove artifacts from log

- There is a [`Regex` function][regex-replace] as well as a [`String` function][string-replace] that can change a part of a string that matches a given regular expression to a different string.
- There is a [modifier][regex-modifiers] that can make the whole regular expression case-insensitive.

## 4. Tag lines with user names

- There is a [`Regex` function][regex-run] that runs a regular expression against a string and returns all captures.

[regex-docs]: https://hexdocs.pm/elixir/Regex.html
[sigils-regex]: https://hexdocs.pm/elixir/sigils.html#regular-expressions
[website-regex-info]: https://www.regular-expressions.info
[website-rexegg]: https://www.rexegg.com/
[website-regexone]: https://regexone.com/
[website-regex-101]: https://regex101.com/
[website-regexr]: https://regexr.com/
[sigil-r]: https://hexdocs.pm/elixir/Kernel.html#sigil_r/2
[match-operator]: https://hexdocs.pm/elixir/Kernel.html#=~/2
[regex-match]: https://hexdocs.pm/elixir/Regex.html#match?/2
[string-match]: https://hexdocs.pm/elixir/String.html#match?/2
[regex-split]: https://hexdocs.pm/elixir/Regex.html#split/3
[string-split]: https://hexdocs.pm/elixir/String.html#split/3
[regex-replace]: https://hexdocs.pm/elixir/Regex.html#replace/4
[string-replace]: https://hexdocs.pm/elixir/String.html#replace/4
[regex-modifiers]: https://hexdocs.pm/elixir/Regex.html#module-modifiers
[regex-run]: https://hexdocs.pm/elixir/Regex.html#run/3
