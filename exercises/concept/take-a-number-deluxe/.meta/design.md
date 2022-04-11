# Design

## Learning objectives

- Know what GenServer is.
- Know how to use GenServer to mix state and behaviour.
- Use the `init` callback to modify initial state.
- Know the difference between `handle_call`, `handle_cast`, and `handle_info`, and use each.
- Know how to send user input to callbacks.
- Know how to define timeouts.

## Out of scope

- Supervision trees.
- Named processes.

## Concepts

- `genserver`

## Prerequisites

- `processes`
- `pids`
- `agent`
- `behaviours`
- `structs`
- `tuples`
- `keyword-lists`
- `typespecs`

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
