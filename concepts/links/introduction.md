# Introduction

Elixir processes are isolated and don't share anything by default. When an unlinked child process crashes, its parent process is not affected.

This behavior can be changed by _linking_ processes to one another. If two processes are linked, a failure in one process will be propagated to the other process. Links are bidirectional.

Processes can be spawned already linked to the calling process using `spawn_link/1` which is an atomic operation, or they can be linked later with `Process.link/1`.

Linking processes can be useful when doing parallelized work when each chunk of work shouldn't be continued in case another chunk fails to finish.

## Trapping exits

Linking can also be used for _supervising_ processes. If a process _traps exits_, it will not crash when a process to which it's linked crashes. It will instead receive a message about the crash. This allows it to deal with the crash gracefully, for example by restarting the crashed process.

A process can be configured to trap exists by calling `Process.flag(:trap_exit, true)`. Note that `Process.flag/2` returns the _old_ value of the flag, not the new one.

The message that will be sent to the process in case a linked process crash will match the pattern `{:EXIT, from, reason}`, where `from` is a PID. If `reason` is anything other than the atom `:normal`, that means that the process crashed or was forcefully killed.
