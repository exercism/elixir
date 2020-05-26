Recursive functions are functions that call themselves.

A recursive function needs to have at least one _base case_ and at least one _recursive case_.

A _base case_ returns a value without calling the function again. A _recursive case_ calls the function again, modifying the input so that it will at some point match the base case.

Very often, each case is written in its own function clause.

```elixir
# base case
def count([]), do: 0

# recursive case
def count([_head | tail]), do: 1 + count(tail)
```

A recursive function can have many base cases and/or many recursive cases. For example [the fibonacci sequence][fibonacci] is a recursive sequence with two base cases:

```elixir
def fibonacci(0), do: 0
def fibonacci(1), do: 1
def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
```

Counting the number of occurrences of x in a list has two recursive cases:

```elixir
def count_occurrences([], _x), do: 0
def count_occurrences([x | tail], x), do: 1 + count_occurrences(tail, x)
def count_occurrences([_ | tail], x), do: count_occurrences(tail, x)
```

## Loops through recursion

Due to immutability, loops in Elixir are written differently from imperative languages. For example, loops commonly look like:

```
for(i = 0; i < array.size; i++) {
  # do something with array[i]
}
```

In a functional language, mutating `i` (by calling `i++`) is not possible. Thus, loops have to be implemented with recursion.

The equivalent of a `for` loop in Elixir would look like this:

```elixir
def loop([]), do: nil

def loop([head | tail]) do
  # do something with head
  each(tail)
end
```

In practice, iterating over lists and other enumerable data structures is most often done using the [`Enum`][module-enum] module. Under the hood, functions from the `Enum` module are [implemented using recursion][enumerable-list-reduce-implementation].

## Infinite execution

Recursive functions, if implemented incorrectly, might never return their result. This can be problematic because each time a function is called, a reference is stored in memory where the VM should return the result (on the [call stack][wiki call stack]). If a recursive function calls itself infinitely, it is possible to run out of memory causing the VM to crash (a [stack overflow error][wiki-stack-overflow]). The Erlang VM, on which Elixir runs, is specially optimized for recursion and reliability, so it may take a long time before infinite recursion errors are apparent or crashes occur.

This problem of infinite execution can be caused by:

- Forgetting to implement a base case.
- Not defining the base case as the first clause.
- Not modifying the argument properly when doing the recursive call, and thus never reaching the base case.

[fibonacci]: https://en.wikipedia.org/wiki/Fibonacci_number
[module-enum]: https://hexdocs.pm/elixir/Enum.html
[enumerable-list-reduce-implementation]: https://github.com/elixir-lang/elixir/blob/291ebf7458bb588be64e0a65afc1b9fd51ebc4dc/lib/elixir/lib/enum.ex#L3767-L3768
[wiki-call-stack]: https://en.wikipedia.org/wiki/Call_stack
[wiki-stack-overflow]: https://en.wikipedia.org/wiki/Stack_overflow
