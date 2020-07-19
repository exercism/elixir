The `Agent` module facilitates an abstraction for spawning processes and the _receive-send_ loop. From here, we will call processes started using the `Agent` module _'agent processes'_. An _agent process_ might be chosen to represent a central shared state.

To start an _agent process_, `Agent` provides the `start/2` function. The supplied function when `start`_-ing_ the _agent process_ returns the initial state of the process:

```elixir
# Start an agent process with an initial value of an empty list
{:ok, agent_pid} = Agent.start(fn -> [] end)
```

Just like `Map` or `List`, `Agent` provides many functions for working with _agent processes_.

It is customary to organize and encapsulate all `Agent`-related functionality into a module for the domain being modeled.
