[Anonymous functions][anon-fns] are commonly used throughout Elixir on their own, as return values, and as arguments in higher order functions such as `Enum.map/2`:

```elixir
Enum.map([1, 2, 3], fn n -> n + 1 end)
# => [2, 3, 4]
```

Functions in Elixir are treated as first class citizens:

- Can be assigned to variables.
- Can be passed around like data as arguments and return values.
- Can be created dynamically.

Anonymous functions are created with the `fn` keyword and invoked with a dot (`.`):

```elixir
function_variable = fn param ->
  param + 1
end

function_variable.(1)
# => 2
```

Anonymous functions may be created with the [`&` capture shorthand][kernal-capture];

- The initial `&` declares the start of the capture expression
- `&1`, `&2`, and so on refer to the positional arguments of the anonymous function

  ```elixir
  # Instead of:
  fn x, y -> abs(x) + abs(y) end

  # We can write:
  & abs(&1) + abs(&2)
  ```

- The & capture operator can also be used to [_capture_ existing named function][capture]:

  ```elixir
  # Instead of:
  fn a, b -> a <= b end

  # We can write using the function and the function's arity:
  &<=/2
  ```

[anon-fns]: https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions
[kernel-fn]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#fn/1
[kernal-capture]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#&/1
[capture]: https://dockyard.com/blog/2016/08/05/understand-capture-operator-in-elixir
