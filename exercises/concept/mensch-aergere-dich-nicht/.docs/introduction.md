# Introduction

## Streams

All functions in the [`Enum` module][exercism-enum] are _eager_. When performing multiple operations on enumerables with the `Enum` module, each operation is going to generate an intermediate result.

The `Stream` module is a _lazy_ alternative to the _eager_ `Enum` module. It offers many of the same functions as `Enum`, but instead of generating intermediate results, it builds a series of computations that are only executed once the stream is passed to a function from the `Enum` module.

Streams implement the _Enumerable [protocol][exercism-protocols]_ and are composable -- you can chain them together to create more complex functionality.

[exercism-enum]: https://exercism.org/tracks/elixir/concepts/enum
[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols
