# Hints

## General

- Read about processes in the official [Getting Started guide][getting-started-processes].
- Read [this blog post][mullen-processes] about Elixir processes.

## 1. Start the machine

- The machine should run in a new process. There is [a built-in function that starts a new process][kernel-spawn-1].
- You will need another function that the new process will execute.

## 2. Report the machine state

- The machine's process needs to respond to messages.
- There is [a built-in function that waits for a message to arrive in the process's mailbox][kernel-receive].
- There is [a built-in function that sends a message to another process][kernel-send].
- Use recursion to wait for more than one message.
- Pass the machine's state as an argument to the recursive function.

## 3. Give out numbers

- This step is conceptually the same as the previous step. The only difference is the need to update the machine's state.

## 4. Stop the machine

- This step doesn't require sending any messages as a response.
- A process will exit if it has no more code to execute.
- This is a base case of the recursive function.

## 5. Ignore unexpected messages

- This step doesn't require sending any messages as a response.
- You can use `_` to match all messages that didn't match previous patterns.

[getting-started-processes]: https://elixir-lang.org/getting-started/processes.html
[mullen-processes]: https://samuelmullen.com/articles/elixir-processes-send-and-receive
[kernel-spawn-1]: https://hexdocs.pm/elixir/Kernel.html#spawn/1
[kernel-receive]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#receive/1
[kernel-send]: https://hexdocs.pm/elixir/Kernel.html#send/2
