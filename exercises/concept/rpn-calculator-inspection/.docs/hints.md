# Hints

## General

- Read about links and tasks in the official [Getting Started guide][getting-started-links].
- Take a look at the [documentation of the `Task` module][task].
- Read ["Demystifying processes in Elixir" on blog.appsignal.com][appsignal-processes].
- Read ["Understanding Exit Signals in Erlang/Elixir" on crypt.codemancers.com][codemancers-exit-signals].

## 1. Start a reliability check for a single input

- You don't need a task for this step, a regular linked process is enough.
- There is a [built-in function][spawn-link] that runs a given anonymous function in a new process and links it to the current process.

## 2. Interpret the results of a reliability check

- To receive a single message, call [`receive`][receive] once. It will read the first message that matches any of the given patterns, leaving other messages in the process inbox.
- Either a guard or [the pin operator][pin-operator] can be used to ensure that only messages from a process whose PID matches the PID given to `await_reliability_check_result/2` as an argument will be received.
- [`receive`][receive] accepts an `after` clause to handle timeouts.

## 3. Run a concurrent reliability check for many inputs

- The current process must start trapping exits before any new linked processes are spawned.
- Trapping exits in a process is achieved by setting a flag on that process.
- There is a [built-in function][process-flag] that sets a flag on a process and returns the old value of that flag.
- The flag for trapping exits is called `:trap_exit` and accepts a boolean value.
- Make use of `Enum` functions to first start a process for each input, and then await messages from each process. Use the functions implemented in the two previous steps. Note that the map returned by `start_reliability_check/2` matches the map that `await_reliability_check_result/2` expects as the first argument.

## 4. Run a concurrent correctness check for many inputs

- Use an asynchronous task for this step.
- There is a [built-in function][task-async] that starts an asynchronous task.
- There is a [built-in function][task-await] that waits for an asynchronous task to finish executing and returns its result. It accepts a timeout as a second argument.
- Make use of `Enum` functions to first start a task for each input, and then wait for each task.

[spawn-link]: https://hexdocs.pm/elixir/Kernel.html#spawn_link/1
[pin-operator]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%5E/1
[receive]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#receive/1
[process-flag]: https://hexdocs.pm/elixir/Process.html#flag/2
[task-async]: https://hexdocs.pm/elixir/Task.html#async/1
[task-await]: https://hexdocs.pm/elixir/Task.html#await/2
[task]: https://hexdocs.pm/elixir/Task.html
[appsignal-processes]: https://blog.appsignal.com/2017/05/18/elixir-alchemy-demystifying-processes-in-elixir.html
[getting-started-links]: https://hexdocs.pm/elixir/processes.html#links
[codemancers-exit-signals]: https://crypt.codemancers.com/posts/2016-01-24-understanding-exit-signals-in-erlang-slash-elixir/
