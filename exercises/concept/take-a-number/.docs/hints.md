# Hints

## General

- Read about processes in the official [Getting Started guide][getting-started-processes].
- Read [this blog post][mullen-processes] about Elixir processes.

## 1. Start the machine

- The machine should run in a new process. There is [a built-in function that starts a new process][kernel-spawn-1].
- Use a 0-arity anonymous function when starting a new process. This function doesn't need to do anything yet.

## 2. Report the machine state

- You will need a new named function. You can name it, for example, `loop`.
- This new function should accept one argument, the state.
- The 0-arity anonymous function from the previous step can call the new named function, passing the initial state.
- The new named function needs to respond to messages.
- There is [a built-in function that waits for a message to arrive in the process's mailbox][kernel-receive].
- There is [a built-in function that sends a message to another process][kernel-send].
- Use recursion to wait for more than one message.

## 3. Give out numbers

- This step is conceptually the same as the previous step. The only difference is the need to update the machine's state.

## 4. Stop the machine

- This step doesn't require sending any messages as a response.
- A process will exit if it has no more code to execute.
- When you need to create an "empty" code block in Elixir, you can use `nil` as the only expression in that code block.
- This is a base case of the recursive function.

## 5. Ignore unexpected messages

- This step doesn't require sending any messages as a response.
- You can use `_` to match all messages that didn't match previous patterns.

[getting-started-processes]: https://hexdocs.pm/elixir/processes.html
[mullen-processes]: https://samuelmullen.com/articles/elixir-processes-send-and-receive
[kernel-spawn-1]: https://hexdocs.pm/elixir/Kernel.html#spawn/1
[kernel-receive]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#receive/1
[kernel-send]: https://hexdocs.pm/elixir/Kernel.html#send/2
