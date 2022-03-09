# Introduction

## Links

Elixir [processes][exercism-processes] are isolated and don't share anything by default. When an unlinked child process crashes, its parent process is not affected.

This behavior can be changed by _linking_ processes to one another. If two processes are linked, a failure in one process will be propagated to the other process. Links are **bidirectional**.

Processes can be spawned already linked to the calling process using `spawn_link/1` which is an atomic operation, or they can be linked later with `Process.link/1`.

Linking processes can be useful when doing parallelized work when each chunk of work shouldn't be continued in case another chunk fails to finish.

### Trapping exits

Linking can also be used for _supervising_ processes. If a process _traps exits_, it will not crash when a process to which it's linked crashes. It will instead receive a message about the crash. This allows it to deal with the crash gracefully, for example by restarting the crashed process.

A process can be configured to trap exits by calling `Process.flag(:trap_exit, true)`. Note that `Process.flag/2` returns the _old_ value of the flag, not the new one.

The message that will be sent to the process in case a linked process crashes will match the pattern `{:EXIT, from, reason}`, where `from` is a PID. If `reason` is anything other than the atom `:normal`, that means that the process crashed or was forcefully killed.

## Tasks

Tasks are [processes][exercism-processes] meant to execute one specific operation.
They usually don't communicate with other processes, but they can return a result to the process that started the task.

Tasks are commonly used to parallelize work.

### `async`/`await`

To start a task, use `Task.async/1`. It takes an anonymous function as an argument and executes it in a new process that is linked to the caller process. It returns a `%Task{}` struct.

To get the result of the execution, pass the `%Task{}` struct to `Task.await/2`. It will wait for the task to finish and return its result. The second argument is a timeout in milliseconds, defaulting to 5000.

Note that between starting the task and awaiting the task, the process that started the task is not blocked and might do other operations.

Any task started with `Task.async/1` should be awaited because it will send a message to the calling process. `Task.await/2` can be called for each task only once.

### `start`/`start_link`

If you want to start a task for side-effects only, use `Task.start/1` or `Task.start_link/1`. `Task.start/1` will start a task that is not linked to the calling process, and `Task.start_link/1` will start a task that is linked to the calling process. Both functions return a `{:ok, pid}` tuple.

[exercism-processes]: https://exercism.org/tracks/elixir/concepts/processes
