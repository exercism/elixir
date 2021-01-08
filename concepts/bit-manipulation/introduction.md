Elixir supports many functions for working with bits found in the _Bitwise module_.

- `&&&/2`: bitwise AND
- `<<</2`: bitwise SHIFT LEFT
- `>>>/2`: bitwise SHIFT RIGHT
- `^^^/2`: bitwise XOR
- `|||/2`: bitwise OR
- `~~~/1`: bitwise NOT

Here is an example how to use a bitwise operator:

```elixir
Bitwise.<<<(1, 2)
# => 4
```

By default, integers are used for bitwise values.
