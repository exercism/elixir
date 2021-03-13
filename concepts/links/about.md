# About

Elixir processes are isolated and don't share anything by default. When an unlinked child process crashes, its parent process is not affected.

```elixir
parent_pid =
  spawn(fn ->
    spawn(fn -> raise "oops" end)

    receive do
      message -> IO.inspect(message, label: "received message")
    end
  end)

# => 20:03:08.405 [error] Process #PID<0.153.0> raised an exception
#    ** (RuntimeError) oops
#    (stdlib 3.13.2) erl_eval.erl:678: :erl_eval.do_apply/6

Process.alive?(parent_pid)
# => true
```

This behavior can be changed by _linking_ processes to one another. If two processes are linked, a failure in one process will be propagated to the other process. Links are **bidirectional**.

```elixir
parent_pid =
  spawn(fn ->
    spawn_link(fn -> raise "oops" end)

    receive do
      message ->
        IO.inspect(message, label: "received message")
    end
  end)

# => 20:05:34.125 [error] Process #PID<0.171.0> raised an exception
#    ** (RuntimeError) oops
#    (stdlib 3.13.2) erl_eval.erl:678: :erl_eval.do_apply/6

Process.alive?(parent_pid)
# => false
```

Processes can be spawned already linked to the calling process using [`spawn_link/1`][spawn-link] which is an atomic operation, or they can be linked later with [`Process.link/1`][process-link].

You can check which processes are currently linked to a process (and still running) with [`Process.info/1`][process-info].

```elixir
pid = spawn_link(fn -> :timer.sleep(50_000) end)
# => #PID<0.126.0>

self()
|> Process.info()
|> Keyword.get(:links)
# => [#PID<0.126.0>]
```

Linking processes can be useful when doing parallelized work when each chunk of work shouldn't be continued in case another chunk fails to finish.

## Trapping exits

Linking can also be used for _supervising_ processes. If a process _traps exits_, it will not crash when a process to which it's linked crashes. It will instead receive a message about the crash. This allows it to deal with the crash gracefully, for example by restarting the crashed process.

A process can be configured to trap exists by calling `Process.flag(:trap_exit, true)`. Note that [`Process.flag/2`][process-flag] returns the _old_ value of the flag, not the new one.

The current value of the flag can be checked using [`Process.info/1`][process-info].

```elixir
pid
|> Process.info()
|> Keyword.get(:trap_exit)
# => false
```

The message that will be sent to the process in case a linked process crashes will match the pattern `{:EXIT, from, reason}`, where `from` is a PID. If `reason` is anything other than the atom `:normal`, that means that the process crashed or was forcefully killed.

```elixir
parent_pid =
  spawn(fn ->
    Process.flag(:trap_exit, true)

    spawn_link(fn -> raise "oops" end)

    receive do
      message ->
        IO.inspect(message, label: "received message")

        # do something else,
        # to demonstrate that the process stays alive
        :timer.sleep(50_000)
    end
  end)

# => 20:05:34.125 [error] Process #PID<0.295.0> raised an exception
#    ** (RuntimeError) oops
#    (stdlib 3.13.2) erl_eval.erl:678: :erl_eval.do_apply/6

# received message: {:EXIT, #PID<0.295.0>,
#   {%RuntimeError{message: "oops"},
#     [{:erl_eval, :do_apply, 6, [file: 'erl_eval.erl', line: 678]}]}}

Process.alive?(parent_pid)
# => true
```

Note that trapping exits makes the process immune to crashes in _all_ of its linked processes, and exit messages might accumulate in the process' mailbox if left unread. For this reason, you should keep track of all the processes linked to a process that traps exits. Usually, processes that trap exits are only responsible for supervising other processes and don't do anything else.

In practice, you wouldn't implement a supervisor process from scratch yourself. Elixir provides an abstraction for this kind of functionality in the form of the [`Supervisor` behaviour][supervisor].

Other abstractions around processes, like [`Agent`][agent], [`GenServer`][genserver], or [`Task`][task], provide two ways of starting them - either `start` or `start_link`.

[proces-exit]: https://hexdocs.pm/elixir/Process.html#exit/2
[process-flag]: https://hexdocs.pm/elixir/Process.html#flag/2
[process-link]: https://hexdocs.pm/elixir/Process.html#link/1
[process-info]: https://hexdocs.pm/elixir/Process.html#info/1
[supervisor]: https://hexdocs.pm/elixir/Supervisor.html
[agent]: https://hexdocs.pm/elixir/Agent.html
[genserver]: https://hexdocs.pm/elixir/GenServer.html
[task]: https://hexdocs.pm/elixir/Task.html
[spawn-link]: https://hexdocs.pm/elixir/Kernel.html#spawn_link/1
