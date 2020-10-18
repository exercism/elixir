While spawning a process is easy, managing its state and behavior can become very complicated. The [`Agent`][agent-module] module is an abstraction to facilitate managing a shared state in an Elixir process.

When using `Agent` module functions it is customary to encapsulate the agent-related functions in a single module.

```elixir
# A simple use of agent processes to represent a counter
defmodule Counter do
  def start_link(initial_value) do
    Agent.start(fn -> initial_value end)
  end

  def value(pid) do
    Agent.get(pid, & &1)
  end

  def increment(pid) do
    Agent.update(pid, &(&1 + 1))
  end
end
```

The choice to use the `Agent` module, or to use multiple processes at all, depends on the relationship to be modeled with the data. _Agent processes_ are useful when a shared state must be used by multiple processes.

It is often the better choice to avoid using a separate process and use an in-process variable to hold the state in a function. Care should also be taken from blindly treating them as a global variable, as they may be manipulated by other processes, creating race conditions, or untraceable errors.

If choosing to use an _agent process_, the goal should be to hold a simple state, encapsulating the calls to the _agent process_ within a module to organize the calls.

If an expensive job should be done in another process, a _task process_ (using [`Task`][task-module]) process should be considered. If it is determined that a process should hold state and perform behaviours, a _GenServer process_ (using [`GenServer`][genserver-module]) should be considered.

[task-module]: https://hexdocs.pm/elixir/Task.html
[genserver-module]: https://hexdocs.pm/elixir/GenServer.html
[agent-module]: https://elixir-lang.org/getting-started/mix-otp/agent.html#agents
