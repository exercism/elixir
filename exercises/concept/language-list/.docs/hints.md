# Hints

## General

- Use the built-in [(linked) list type][list].

## 1. Define a function to return an empty language list

- The function needs to return `[]`.

## 2. Define a function to add a language to the list

- An element can be prepended to a list using `|`.

## 3. Define a function to remove a language from the list

- Elixir [provides a function][tl] to return a list with the first item removed.

## 4. Define a function to return the first item in the list

- Elixir [provides a function][hd] to get the first item from a list.

## 5. Define a function to return how many languages are in the list

- Elixir [provides a function][length] to count the length of a list.

## 6. Define a function to determine if the list includes a functional language

- Your function should return a boolean value indicating whether `"Elixir"` is a member of the list. Elixir [provides a function][in] to test list membership.

[list]: https://hexdocs.pm/elixir/lists-and-tuples.html#linked-lists
[hd]: https://hexdocs.pm/elixir/Kernel.html#hd/1
[tl]: https://hexdocs.pm/elixir/Kernel.html#tl/1
[length]: https://hexdocs.pm/elixir/Kernel.html#length/1
[in]: https://hexdocs.pm/elixir/Kernel.html#in/2
