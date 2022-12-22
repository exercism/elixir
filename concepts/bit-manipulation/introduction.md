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
Bitwise.bsl(1, 3)
# => 8
```

All bitwise functions only work on integers.

**Note:** You will need to call `require Bitwise` at the beginning of the module definition to be able to use the _Bitwise_ module functions like in the example above: `Bitwise.bsl(1, 3)` . Also you can call `import Bitwise` and use imported functions directly: `bsl(1, 3)`.
