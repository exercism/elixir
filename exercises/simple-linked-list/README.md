# Simple Linked List

Write a simple linked list implementation that uses Elements and a List.

The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures. They're
pervasive in functional programming languages, such as Clojure, Erlang,
or Haskell, but far less common in imperative languages such as Ruby or
Python.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements.

This variant of linked lists is often used to represent sequences or
push-down stacks (also called a LIFO stack; Last In, First Out).

As a first take, lets create a singly linked list to contain the range (1..10),
and provide functions to reverse a linked list and convert to and from arrays.

When implementing this in a language with built-in linked lists,
implement your own abstract data type.

## Running tests

Execute the tests with:

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

For more detailed information about the Elixir track, please
see the [help page](http://exercism.io/languages/elixir).

## Source

Inspired by 'Data Structures and Algorithms with Object-Oriented Design Patterns in Ruby', singly linked-lists. [http://www.brpreiss.com/books/opus8/html/page96.html#SECTION004300000000000000000](http://www.brpreiss.com/books/opus8/html/page96.html#SECTION004300000000000000000)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
