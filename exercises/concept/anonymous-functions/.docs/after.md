Great work! Now we have a system that we can combine functions into a complex encryption. You have now also worked with anonymous functions!

[Anonymous functions][anon-fns] are commonly used throughout Elixir on their own, as return values, and as arguments in higher order functions such as `Enum.map/2`:

```elixir
Enum.map([1, 2, 3], &(&1 + 1))
# => [2, 3, 4]
```

## Key points

- Functions are treated as first class citizens:
  - Can be assigned to variables.
  - Can be passed around like data as arguments and return values.
  - Can be created dynamically.
- [Anonymous functions][anon-fns] are created with the `fn` keyword:

  - they are invoked with the `.` token

  ```elixir
  function_variable = fn param ->
    param + 1
  end

  function_variable.(1)
  # => 2
  ```

  - they may be immediately invoked on creation:

  ```elixir
  (fn x, y -> x + y end).(2, 3)
  # => 5
  ```

- [Anonymous functions][anon-fns] may be created with the [capture shorthand][capture]:

  ```elixir

  captured_variable = &(&1 + 1)

  captured_variable.(1)
  # => 2
  ```

- Named functions can also be [captured][capture]:

  - The initial `&` declares the start of the capture expression
  - `&1`, `&2`, and so on refer to the positional arguments of the anonymous function

  ```elixir
  # Instead of:
  fn tuple -> elem(tuple, 0) end

  # We can write:
  &elem(&1, 0)
  ```

  ```elixir
  # Instead of:
  fn a, b -> a <= b end

  # We can write using the function and the function's arity:
  &<=/2
  ```

- Bound variables from an outer scope can be used in an inner scope using the bound variable name to [create closures][closure].

  ```elixir
  def return_closure(x) do
    fn -> x end
  end
  ```

- [Bitwise binary functions][bitwise-wiki] can be performed on an integers' binary representation using functions from the [Bitwise module][bitwise-hexdocs]

[anon-fns]: https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions
[bitwise-hexdocs]: https://hexdocs.pm/elixir/Bitwise.html
[bitwise-wiki]: https://en.wikipedia.org/wiki/Bitwise_operation
[capture]: https://dockyard.com/blog/2016/08/05/understand-capture-operator-in-elixir
[closure]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
