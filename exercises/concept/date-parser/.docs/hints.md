# Hints

## General

- Review regular expression patterns from the introduction. Remember, when creating the pattern a string, you must escape some characters.
- Read about the [`Regex` module][regex-docs] in the documentation.
- Read about the [regular expression sigil][sigils-regex] in the Getting Started guide.
- Check out this website about regular expressions: [Regular-Expressions.info][website-regex-info].
- Check out this website about regular expressions: [Rex Egg -The world's most tyrannosauical regex tutorial][website-rexegg].
- Check out this website about regular expressions: [RegexOne - Learn Regular Expressions with simple, interactive exercises.][website-regexone].
- Check out this website about regular expressions: [Regular Expressions 101 - an online regex sandbox][website-regex-101].
- Check out this website about regular expressions: [RegExr - an online regex sandbox][website-regexr].

## 1. Match the day, month, and year from a date

- Remember to return a string representing the regular expression pattern.
- Review how to create _character classes_ or use _shorthand character classes_.
- Review _quantifiers_.
- A day is one or two digits.
- A month is one or two digits.
- A year is four digits.

## 2. Match the day of the week and the month of the year

- Review how to write a pattern to match _string literals_.
- Review _alternations_.
- Wrap the whole expression in a _group_.

## 3. Capture the day, month, and year

- Review how to write patterns for captures and named captures.
- Reuse the `day/0`, `month/0`, `year/0`, `day_names/0`, and `month_names/0` functions that you already implemented.

## 4. Combine the captures to capture the whole date

- Remember, string interpolation may be used to join strings.
- Reuse the `capture_day/0`, `capture_month/0`, `capture_year/0`, `capture_day_name/0`, and `capture_month_name/0` functions that you already implemented.

## 5. Narrow the capture to match only on the date

- Remembers, _anchors_ help to match the pattern to the **whole line**.
- String interpolation may be used in the regular expression sigil syntax.
- Reuse the `capture_numeric_date/0`, `capture_month_name_date/0`, and `capture_day_month_name_date/0` functions that you already implemented.

[regex-docs]: https://hexdocs.pm/elixir/Regex.html
[sigils-regex]: https://hexdocs.pm/elixir/sigils.html#regular-expressions
[website-regex-info]: https://www.regular-expressions.info
[website-rexegg]: https://www.rexegg.com/
[website-regexone]: https://regexone.com/
[website-regex-101]: https://regex101.com/
[website-regexr]: https://regexr.com/
[website-regex-crossword]: https://regexcrossword.com/
