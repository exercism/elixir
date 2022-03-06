# Design

## Learning objectives

- Know what GenServer is
- Use all three kinds of callbacks - handle call/cast/info

## Out of scope

## Concepts

- `genserver`

## Prerequisites

- `processes`
- `pids`
- `agent`
- `behaviours`
- `struct`
- `tuples`
- `keyword-lists`

## Analyzer

- Make sure that `GenServer` is used.
- Make sure that `@impl` is used.

## Notes

The test "the process doesn't have a name" seems a bit weird, but it helps avoid problems with starting the same GenServer multiple times in next tests.

Those assertions do not really check if the user defined the callbacks:
```elixir
assert function_exported?(TakeANumberDeluxe, :handle_info, 2)
```

That's because `use GenServer` defines them. So they're more like proxy assertions for `use GenServer`.
