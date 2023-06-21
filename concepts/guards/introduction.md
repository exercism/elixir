# Introduction

Guards are used to prevent Elixir from invoking functions based on evaluation of the arguments by guard functions. Guards begin with the `when` keyword, followed by a boolean expression. Guard functions are special functions which:

- Must be pure and not mutate any global states.
- Must return strict `true` or `false` values.

A list of common guards can be found in the [Elixir documentation][kernel-guards]. It includes type checks, basic arithmetic, comparisons, and strictly boolean operators.

[kernel-guards]: https://hexdocs.pm/elixir/Kernel.html#guards
