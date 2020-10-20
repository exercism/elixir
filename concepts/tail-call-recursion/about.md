A function is [tail-recursive][recursion-tc] if the _last_ thing executed by the function is a call to itself.

Each time any function is called, a _stack frame_ with its local variables, arguments etc. is put on top of [the function call stack][call-stack]. When a function returns, the stack frame is removed from the stack.

Tail-recursive functions allow for [tail call optimization][tail-call-optimization]. It's an optimization that allows reusing the last stack frame by the next function call because the previous function is guaranteed not to need it anymore. This mitigates concerns of overflowing the function call stack, which is a situation when there are so many frames on the function call stack that there isn't any memory left to create another one.

- In order to achieve tail call recursion in Elixir, an accumulator is often required because of data immutability rules.

  - An accumulator is a variable that is passed along the recursive call keeping the current state of the recursive function _so far_ until the final result is returned in the base case.

    ```elixir
    # Count the length of a list without an accumulator
    def count([]), do: 0
    def count([_head | tail]), do: 1 + count(tail)

    # Count the length of a list with an accumulator
    def count(list), do: do_count(list, 0)

    defp do_count([], count), do: count
    defp do_count([_head | tail], count), do: do_count(tail, count + 1)
    ```

- When working with lists, remember they are implemented as singly-linked lists: prepend operations are very fast, but append operations are very slow.

  ```elixir
  # Reverse a list with an accumulator
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
  ```

[call-stack]: https://en.wikipedia.org/wiki/Call_stack
[recursion-tc]: https://en.wikipedia.org/wiki/Tail_call
[tail-call-optimization]: https://dino.codes/posts/tail-call-optimization-in-elixir/
