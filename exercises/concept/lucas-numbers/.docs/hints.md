# Hints

## General

- Use the built-in [(linked) list type][list].
- Use the built-in [`Stream`][stream] module functions to create a stream

## 1. Catch bad arguments

- Use a [guard][guards] to catch the cases when an integer isn't passed as an argument to `generate/1`.

## 2. Generate the base cases

- You can use multiple [function clauses][multiple-fn-clauses] and [pattern-matching][pattern-matching] to create the base case functions.

## 3. Create the generalized case

- Use the [`Stream.iterate/2`][stream-iterate] function to generate a sequence of numbers, with the next being created from the previous.
- The starting numbers are `2` then `1`, which you can pass in together using a tuple to make a pair `{2, 1}`
- Make sure the next number is the sum of the two numbers previous to it.
- To evaluate the stream to a list, use an [`Enum`][enum] function.

[enum]: https://hexdocs.pm/elixir/Enum.html#content
[guards]: https://hexdocs.pm/elixir/patterns-and-guards.html#guards
[list]: https://hexdocs.pm/elixir/lists-and-tuples.html#linked-lists
[multiple-fn-clauses]: https://hexdocs.pm/elixir/modules-and-functions.html#function-definition
[pattern-matching]: https://hexdocs.pm/elixir/pattern-matching.html#pattern-matching
[stream]: https://hexdocs.pm/elixir/Stream.html#content
[stream-iterate]: https://hexdocs.pm/elixir/Stream.html#iterate/2
