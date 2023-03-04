# Hints

## General

- Read about [IO][getting-started-io] in the Getting Started guide.
- Read about [debugging with `IO.inspect/2`][getting-started-debugging-io-inspect] in the Getting Started guide.
- Read about the [`IO` module][module-io] in the documentation.

## 1. Welcome the new player

- There is a [built-in function][io-puts] that writes a string to the standard output.

## 2. Ask for the character's name

- There is a [built-in function][io-gets] that reads a string from the standard output. It can also write a prompt, so there is no need to use a separate function to write the question.
- There is a [build-in function][string-trim] in the `String` module that can remove trailing and leading whitespace from the input.

## 3. Ask for the character's class

- There is a [built-in function][io-gets] that reads a string from the standard output. It can also write a prompt, so there is no need to use a separate function to write the question.
- There is a [build-in function][string-trim] in the `String` module that can remove trailing and leading whitespace from the input.

## 4. Ask for the character's level

- There is a [built-in function][io-gets] that reads a string from the standard output. It can also write a prompt, so there is no need to use a separate function to write the question.
- There is a [build-in function][string-trim] in the `String` module that can remove trailing and leading whitespace from the input.
- There is a [build-in function][string-to-integer] in the `String` module that can convert a string to an integer.

## 5. Combine previous steps into one

- Reuse functions implemented in previous steps.
- There is a [built-in function][io-inspect], useful for debugging, that can write to the standard output more than just strings. That functions accepts options, for example a string that will be written before the passed value.
- The function and its option mentioned above will append a colon and a space to that string for you.

[module-io]: https://hexdocs.pm/elixir/IO.html
[getting-started-io]: https://elixir-lang.org/getting-started/io-and-the-file-system.html#the-io-module
[getting-started-debugging-io-inspect]: https://elixir-lang.org/getting-started/debugging.html#ioinspect2
[elixir-school-io-inspect-label]: https://elixirschool.com/blog/til-io-inspect-labels/
[io-puts]: https://hexdocs.pm/elixir/IO.html#puts/2
[io-gets]: https://hexdocs.pm/elixir/IO.html#gets/2
[io-inspect]: https://hexdocs.pm/elixir/IO.html#inspect/2
[string-trim]: https://hexdocs.pm/elixir/String.html#trim/1
[string-to-integer]: https://hexdocs.pm/elixir/String.html#to_integer/1
