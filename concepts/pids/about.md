Each Elixir process has its own unique identifier - a _PID_ (process identifier).

- PIDs are their own datatype.
  - You can check if a variable is a PID with [`is_pid/1`][kernel-is-pid]
- You can get the current process' PID with `self()`.
- PIDs function as _mailbox addresses_ - if you have a process' PID, you can send a message to that process.
- PIDs are usually created indirectly, as a return value of functions that create new processes, like `spawn`.
  - PIDs should not be created directly by the programmer. If it were required, Erlang has a [`list_to_pid/1`][erlang-list-to-pid] function.

[kernel-is-pid]: https://hexdocs.pm/elixir/Kernel.html#is_pid/1
[erlang-list-to-pid]: https://erlang.org/doc/man/erlang.html#list_to_pid-1
