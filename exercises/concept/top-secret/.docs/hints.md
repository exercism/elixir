# Hints

## General

- Read about quoting in the [official Getting Started guide][getting-started-quote].
- Read the [introduction to Elixir AST by Lucas San Román][ast-intro-lucas].
- Read [the official documentation for `quote`][doc-quote].
- Inspect the output of [`quote`][doc-quote] to familiarize yourself with how ASTs look like for specific code snippets.

## 1. Turn code into data

- There is a [built-in function][doc-code-string-to-quoted] that turns a string with code into an AST.

## 2. Parse a single AST node

- Inspect the output of [`quote`][doc-quote] to familiarize yourself with how ASTs look like for specific code snippets.
- The operations that define a function are `:def` and `:defp`.
- The operation is the first element in a three-element AST node tuple.
- You can ignore the second element in the tuple in this exercise completely.
- The third element in the tuple is the argument list of the operation that defines the function.
- The first element on that list is a tuple with the function's name and arguments, and the second element is the function's body.

## 3. Decode the secret message part from function definition

- Inspect the output of [`quote`][doc-quote] to familiarize yourself with how ASTs look like for specific code snippets.
- The AST node that contains the function's name also contains the function's argument list as the third element.
- The arity of a function is the length of its argument list.
- There is a [built-in function in the `String` module][string-slice] that can get the first `n` characters from a string.
- A function without arguments written without parentheses will not have a list as argument but an atom.

## 4. Fix the decoding for functions with guards

- Inspect the output of [`quote`][doc-quote] to familiarize yourself with how ASTs look like for specific code snippets.
- When a function has a guard, the third element in the tuple for the `:def/:defp` operation is a bit different.
- That third element is a list with two elements, the first one is the tuple for the `:when` operation, and the second one is the function's body.
- The `:when` operation's arguments are a two-element list, where the first argument is the function's name, and the second is the guard expression.

## 5. Decode the full secret message

- Use the function `to_ast/1` that you implemented in the first task to create the AST.
- There is a [built-in function][macro-prewalk] that can visit each node in an AST with an accumulator.
- Use the function `decode_secret_message_part/2` that you implemented in previous tasks to prewalk the AST.
- To reverse the accumulator at the end and turn it into a string, refresh your knowledge of the [`Enum` module][enum].

[getting-started-quote]: https://elixir-lang.org/getting-started/meta/quote-and-unquote.html#quoting
[doc-quote]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#quote/2
[ast-intro-lucas]: https://dorgan.ar/posts/2021/04/the_elixir_ast/
[doc-code-string-to-quoted]: https://hexdocs.pm/elixir/Code.html#string_to_quoted/2
[string-slice]: https://hexdocs.pm/elixir/String.html#slice/2
[macro-prewalk]: https://hexdocs.pm/elixir/Macro.html#prewalk/3
[enum]: https://hexdocs.pm/elixir/Enum.html
