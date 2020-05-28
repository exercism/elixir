## General

- Read about strings in the official [Getting Started Elixir guide][getting-started-strings].
- Browse the [functions available in the _String module_][string-module-functions] to discover which operations on strings Elixir's standard library offers.

## 1. Get the name's first letter

- There is a [built-in function][string-first] to get the first character from a string.
- There are multiple [built-in functions][string-trim] to remove leading, trailing, or leading and trailing whitespaces from a string.

## 2. Format the first letter as an initial

- There is a [built-in function][string-upcase] to convert all characters in a string to their uppercase variant.
- There is an [operator][kernel-concat] that concatenates two strings.

## 3. Split the full name into the first name and the last name

- There is a [built-in function][string-split] that splits a string on whitespace characters.
- A few first elements of a list can be assigned to variables by pattern matching on the list.

## 4. Put the initials inside of the heart

- There is a special syntax for [interpolating][string-interpolation] an expression inside of a string.
- There is a special syntax for writing [multiline strings][heredoc-syntax] without needing to escape newlines.

[getting-started-strings]: https://elixir-lang.org/getting-started/basic-types.html#strings
[string-module-functions]: https://hexdocs.pm/elixir/String.html#functions
[string-first]: https://hexdocs.pm/elixir/String.html#first/1
[string-trim]: https://hexdocs.pm/elixir/String.html#trim/1
[string-upcase]: https://hexdocs.pm/elixir/String.html#upcase/2
[string-split]: https://hexdocs.pm/elixir/String.html#split/1
[string-interpolation]: https://hexdocs.pm/elixir/String.html#module-interpolation
[kernel-concat]: https://hexdocs.pm/elixir/Kernel.html#%3C%3E/2
[heredoc-syntax]: https://elixir-examples.github.io/examples/multiline-strings-heredocs
