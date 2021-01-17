## Processes

In Elixir, all code runs inside processes.

By default, a function will execute in the same process from which it was called. When you need to explicitly run a certain function in a new process, use `spawn/1`:

```elixir
spawn(fn -> 2 + 2 end)
# => #PID<0.125.0>
```

`spawn/1` creates a new process that executes the given function and returns a _process identifier_ (PID). The new process will stay alive as long as the function executes, and then silently exit.

Elixir's processes should not be confused with operating system processes. Elixir's processes use much less memory and CPU. It's perfectly fine to have Elixir applications that run hundreds of Elixir processes.

### Messages

Processes do not directly share information with one another. Processes _send and receive messages_ to share data.

You can send a message to any process with `send/2`. The first argument to `send/2` is the PID of the recipient, the second argument is the message.

A message can be of any type. Often it consists of atoms and tuples. If you want to get a response, you should include the PID of the sender somewhere in the message. You can get the PID of the current process with `self()`.

`send/2` does not check if the message was received by the recipient, nor if the recipient is still alive. The message ends up in the recipient's _mailbox_ and it will only be read if and when the recipient explicitly asks to _receive messages_.

A message can be read from a mailbox using the `receive/1` macro. It accepts a `do` block that can pattern match on the messages.

```elixir
receive do
  {:ping, sender_pid} -> send(sender_pid, :pong)
  :do_nothing -> nil
end
```

`receive/1` will take _one message_ from the mailbox that matches any of the given patterns and execute the expression given for that pattern. If there are no messages in the mailbox, or none of messages in the mailbox match any of the patterns, `receive/1` is going to wait for one.

### Receive loop

If you want to receive more than one message, you need to call `receive/1` recursively. It is a common pattern to implement a recursive function, for example named `loop`, that calls `receive/1`, does something with the message, and then calls itself to wait for more messages. If you need to carry some state from one `receive/1` call to another, you can do it by passing an argument to that `loop` function.

## PIDs

Process identifiers are their own datatype. They function as _mailbox addresses_ - if you have a process' PID, you can send a message to that process. PIDs are usually created indirectly, as a return value of functions that create new processes, like `spawn`.
