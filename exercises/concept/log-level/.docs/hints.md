# Hints

## General

- The [atom type is described here][atom].

## 1. Determine the log label

- You can use the [`cond/1` special form][cond] to elegantly handle the various log codes.
- You can use [equality operators][equality] to compare integers for strict type equality.
- There is a [way to specify a default branch][cond] in a cond expression that can be used to catch unspecified cases.

## 2. Send an alert

- You can use the [`cond/1` special form][cond] to decide if an alert should be sent.
- You can use [equality operators][equality] to compare atoms for equality.

[equality]: https://hexdocs.pm/elixir/Kernel.html#==/2
[atom]: https://hexdocs.pm/elixir/basic-types.html#atoms
[cond]: https://hexdocs.pm/elixir/case-cond-and-if.html#cond
