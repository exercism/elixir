In Elixir, all code runs inside processes. Elixir processes:

- Should not be confused with system processes.
- Are lightweight.
- Have specific use cases. They can:
  - [Keep global state][getting-started-processes-state].
  - [Contain failure][getting-started-processes-links].
  - Allow for concurrent and asynchronous code.
- It is normal to have an Elixir app that runs _hundreds_ of processes, but also one that doesn't explicitly create new processes at all, especially if it's a library.

## Creating processes

By default, a function will execute in the same process from which it was called. When you need to explicitly run a certain function in a new process, use `spawn`:

- [`spawn/1`][kernel-spawn-1] accepts a function that it will execute directly.

  ```elixir
  spawn(fn -> 2 + 2 end)
  # => #PID<0.125.0>
  ```

- [`spawn/3`][kernel-spawn-3] accepts a function that it will execute by the module name, the function name (as atom), and a list of arguments to pass to that function.

  ```elixir
  spawn(String, :split, ["hello there", " "])
  # => #PID<0.113.0>
  ```

  - This data triplet is often called an _MFA_ — _Module, Function, Arguments_.

- A process exits as soon as its function has finished executing.

- You can check if a process is still _alive_ (executing) with [Process.alive?/1][process-alive]:

  ```elixir
  pid = spawn(fn -> 2 + 2 end)
  Process.alive?(pid)
  # => false
  ```

## Messages

Processes do not directly share information with one another. Processes _send messages_ to share data. This concurrency pattern is called the [Actor model][wiki-actor-model].

- Send messages to a process using [send/2][kernel-send].

  ```elixir
  send(pid, :hello)
  ```

  - The message ends up in the recipient's _mailbox_ in the order that they are sent.
  - `send` does not check if the message was received nor if the recipient is still alive.

- A message can be of any type.
- You can receive a message sent to the current process using [`receive/1`][kernel-receive].

  - You need to pattern match on messages.
  - `receive` waits until one message matching any given pattern is in the processes mailbox.
    - By default, it waits indefinitely, but can be given a timeout using an `after` block.
  - Read messages are removed from the process' mailbox. Unread messages will stay there indefinitely.
    - Always write a catch-all `_` clause in `receive/1` to avoid running of out memory due to piled up unread messages.

  ```elixir
  receive do
    {:ping, sender_pid} -> send(sender_pid, :pong)
    _ -> nil
  after
    5000 ->
      {:error, "No message in 5 seconds"}
  end
  ```

## Receive loop

If you want to receive more than one message, you need to call `receive/1` recursively. It is a common pattern to implement a recursive function, for example named `loop`, that calls `receive/1`, does something with the message, and then calls itself to wait for more messages. If you need to carry some state from one `receive/1` call to another, you can do it by passing an argument to that `loop` function.

```elixir
def loop(state) do
  receive do
    :increment_by_one ->
      loop(state + 1)

    {:report_state, sender_pid} ->
      send(sender_pid, state)
      loop(state)

    :stop ->
      nil

    _ ->
      loop(state)
  end
end
```

In practice, this approach is rarely used directly. Elixir offers concurrency abstractions, such as the [`Agent` module][agent] or a [_`GenServer` behaviour`_][genserver], that both build on top of the receive loop. However, it is crucial to understand those basics to be able to efficiently use the abstractions.

[getting-started-processes-state]: https://elixir-lang.org/getting-started/processes.html#state
[getting-started-processes-links]: https://elixir-lang.org/getting-started/processes.html#state
[process-alive]: https://hexdocs.pm/elixir/Process.html#alive?
[agent]: https://hexdocs.pm/elixir/Agent.html
[genserver]: https://hexdocs.pm/elixir/GenServer.html
[kernel-spawn-1]: https://hexdocs.pm/elixir/Kernel.html#spawn/1
[kernel-spawn-3]: https://hexdocs.pm/elixir/Kernel.html#spawn/3
[kernel-receive]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#receive/1
[kernel-send]: https://hexdocs.pm/elixir/Kernel.html#send/2
[wiki-actor-model]: https://en.wikipedia.org/wiki/Actor_model
