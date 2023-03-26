# Introduction

## Tail Call Recursion

When [recursing][exercism-recursion] through enumerables (lists, bitstrings, strings), there are often two concerns:

- how much memory is required to store the trail of recursive function calls
- how to build the solution efficiently

To deal with these concerns an _accumulator_ may be used.

An accumulator is a variable that is passed along in addition to the data. It is used to pass the current state of the function's execution, from function call to function call, until the _base case_ is reached. In the base case, the accumulator is used to return the final value of the recursive function call.

Accumulators should be initialized by the function's author, not the function's user. To achieve this, declare two functions - a public function that takes just the necessary data as arguments and initializes the accumulator, and a private function that also takes an accumulator. In Elixir, it is a common pattern to prefix the private function's name with `do_`.

```elixir
# Count the length of a list without an accumulator
def count([]), do: 0
def count([_head | tail]), do: 1 + count(tail)

# Count the length of a list with an accumulator
def count(list), do: do_count(list, 0)

defp do_count([], count), do: count
defp do_count([_head | tail], count), do: do_count(tail, count + 1)
```

The usage of an accumulator allows us to turn recursive functions into _tail-recursive_ functions. A function is tail-recursive if the _last_ thing executed by the function is a call to itself.

[exercism-recursion]: https://exercism.org/tracks/elixir/concepts/recursion
