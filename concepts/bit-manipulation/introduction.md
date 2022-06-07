# Introduction

Elixir supports many functions for working with bits found in the _Bitwise module_.

- `band/2`: bitwise AND
- `bsl/2`: bitwise SHIFT LEFT
- `bsr/2`: bitwise SHIFT RIGHT
- `bxor/2`: bitwise XOR
- `bor/2`: bitwise OR
- `bnot/1`: bitwise NOT

Here is an example how to use a bitwise function:

```elixir
Bitwise.bsl(1, 2)
# => 4
```

All bitwise functions only work on integers.
