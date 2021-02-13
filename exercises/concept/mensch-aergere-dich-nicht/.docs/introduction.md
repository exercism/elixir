# Introduction

## Pipe Operator

The `|>` operator is called the pipe operator. It can be used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

```elixir
1..5
|> Enum.map(fn n -> n * n end)
|> Enum.filter(fn n -> rem(n, 2) == 0 end)
# => [4, 16]
```

## Streams

All functions in the `Enum` module are _eager_. When performing multiple operations on enumerables with the `Enum` module, each operation is going to generate an intermediate result.

The `Stream` module is a _lazy_ alternative to the _eager_ `Enum` module. It offers many of the same functions as `Enum`, but instead of generating intermediate results, it builds a series of computations that are only executed once the stream is passed to a function from the `Enum` module.

Streams implement the _Enumerable protocol_ and are composable.
