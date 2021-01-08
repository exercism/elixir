When recursing through enumerables [lists, bitstrings, strings], there are often two concerns:

- how much memory is required to store the trail of recursive function calls
- how to build the solution efficiently

To deal with these concerns an _accumulator_ may be used to pass the state of the function _so far_ until the result reaches the _base case_ and returns the value. An accumulator is a variable that is passed along in addition to the data.

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
