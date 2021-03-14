# Hints

## General

- Use the built-in [(linked) list type][list].
- Use the built-in [Stream][stream] module functions to create a stream

## 1. Generate the base cases

- You can use multiple [function clauses][multiple-fn-clauses] and [pattern-matching][pattern-matching] to create the base case functions.

## 2. Create the generalized case

- Use a [Stream][stream] function to generate a sequence of numbers, with the next being created from the previous.
- The starting numbers are `2` then `1`, which you can pass in one parameter using a tuple to make a pair `{2, 1}`
- Make sure sure the next number is the sum of the two numbers previous to it.

## 3. Catch bad arguments

- Use a [guard][guard] to catch the cases when an integer isn't passed as an argument to `generate/1`.

[guards]: https://hexdocs.pm/elixir/master/patterns-and-guards.html#guards
[list]: https://elixir-lang.org/getting-started/basic-types.html#linked-lists
[stream]: https://hexdocs.pm/elixir/Stream.html#content
[multiple-fn-clauses]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[pattern-matching]: https://elixir-lang.org/getting-started/pattern-matching.html#pattern-matching-1
