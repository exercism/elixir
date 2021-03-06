# Introduction

Elixir processes are isolated and don't share anything by default. When a child process crashes, its parent process is not affected.

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

This behavior can be changed by _linking_ processes to one another. If two processes are linked, a failure in one process will be propagated to the other process. Links are bidirectional.

```elixir
parent_pid =
  spawn(fn ->
    spawn_link(fn -> raise "oops" end)

    receive do
      message -> IO.inspect(message, label: "received message")
    end
  end)

# => 20:05:34.125 [error] Process #PID<0.171.0> raised an exception
#    ** (RuntimeError) oops
#    (stdlib 3.13.2) erl_eval.erl:678: :erl_eval.do_apply/6

Process.alive?(parent_pid)
# => false
```

Processes can be spawned already linked to the calling process using `spawn_link/1` which is an atomic operation, or they can be linked later with `Process.link/1`.

Linking processes can be useful when doing parallelized work when each chunk of work shouldn't be continued in case another chunk fails to finish.

## Trapping exits

Linking can also be used for _supervising_ processes. If a process _traps exits_, it will not crash when a process to which it's linked crashes. It will instead receive a message about the crash. This allows it to deal with the crash gracefully, for example by restarting the crashed process.

A process can be configured to trap exists by calling `Process.flag(:trap_exit, true)`.

The message that will be sent to the process in case of a linked process crash will match the pattern `{:EXIT, from, reason}`, where `from` is a PID.

```elixir
parent_pid =
  spawn(fn ->
    Process.flag(:trap_exit, true)

    spawn_link(fn -> raise "oops" end)

    receive do
      message ->
        IO.inspect(message, label: "received message")
        
        receive do
          _ -> nil
        end
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
