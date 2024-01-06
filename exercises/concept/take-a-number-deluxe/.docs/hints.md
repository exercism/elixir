# Hints

## General

- Read about `GenServer` in the official [Getting Started guide][getting-started-genserver].
- Read about `GenServer` on [elixirschool.com][elixir-school-genserver].
- Read about the `GenServer` behaviour [in the documentation][genserver].

## 1. Start the machine

- Remember to [use][use] the [`GenServer` behaviour][genserver].
- There is [a built-in function][start-link] that starts a linked `GenServer` process. The only thing that `TakeANumberDeluxe.start_link/2` needs to do is call that function with the right arguments.
- `__MODULE__` is a special variable that holds the name of the current module.
- Implement the [`GenServer` callback used when starting the process][init].
- The callback should return either `{:ok, state}` or `{:stop, reason}`.
- Read the options from the `init_arg` keyword list.
- There is [a built-in function][keyword-get] to get a value from a keyword list.
- Use `TakeANumberDeluxe.State.new/2` to get the initial state.
- Use `@impl` above your callback implementation to mark which behaviour this callback comes from.

## 2. Report machine state

- There is [a built-in function][call] that sends a message to a `GenServer` process and receives a reply. The only thing that `TakeANumberDeluxe.report_state/1` needs to do is call that function with the right arguments.
- The messages sent to a server can be anything, but atoms are best.
- Implement the [`GenServer` callback used when handling messages that need a reply][handle-call].
- The callback should return `{:reply, reply, state}`.
- Pass the state as the reply.
- Use `@impl` above your callback implementation to mark which behaviour this callback comes from.

## 3. Queue new numbers

- There is [a built-in function][call] that sends a message to a `GenServer` process and receives a reply. The only thing that `TakeANumberDeluxe.queue_new_number/1` needs to do is call that function with the right arguments.
- The messages sent to a server can be anything, but atoms are best.
- Implement the [`GenServer` callback used when handling messages that need a reply][handle-call].
- The callback should return `{:reply, reply, state}`.
- Get the reply and the new state by calling `TakeANumberDeluxe.State.queue_new_number/1`. Use a [`case`][case] expression to pattern match the return value.
- The reply should be either `{:ok, new_number}` or `{:error, error}`.
- Use `@impl` above your callback implementation to mark which behaviour this callback comes from.

## 4. Serve next queued number

- There is [a built-in function][call] that sends a message to a `GenServer` process and receives a reply. The only thing that `TakeANumberDeluxe.serve_next_queued_number/2` needs to do is call that function with the right arguments.
- The messages sent to a server can be anything, but tuples are best if an argument needs to be sent in the message. Use a message like this: `{:my_message_name, some_argument}`.
- Implement the [`GenServer` callback used when handling messages that need a reply][handle-call].
- The callback should return `{:reply, reply, state}`.
- Get the reply and the new state by calling `TakeANumberDeluxe.State.serve_next_queued_number/2`. Use a [`case`][case] expression to pattern match the return value.
- The reply should be either `{:ok, next_number}` or `{:error, error}`.
- Use `@impl` above your callback implementation to mark which behaviour this callback comes from.

## 5. Reset state

- There is [a built-in function][cast] that sends a message to a `GenServer` process and does not wait for a reply. The only thing that `TakeANumberDeluxe.reset_state/1` needs to do is call that function with the right arguments.
- The messages sent to a server can be anything, but atoms are best.
- Implement the [`GenServer` callback used when handling messages that do not need a reply][handle-cast].
- The callback should return `{:noreply, state}`.
- Use `TakeANumberDeluxe.State.new/2` to get the new state, just like in `init/1`.
- Use `@impl` above your callback implementation to mark which behaviour this callback comes from.

## 6. Implement auto shutdown

- Extend all `init/1` and `handle_*` callbacks to return one extra element in their tuples. Its value should be `state.auto_shutdown_timeout`.
- The return value `{:stop, reason}` of `init/1` does not need a timeout.
- Implement the [`GenServer` callback used when handling messages that weren't sent in the usual `GenServer` way][handle-info].
- This callback needs to handle `:timeout` messages and exit the process, but also catch and ignore any other messages.
- To exit a GenServer process, return `{:stop, reason, state}` from the callback.
- The exit reason should be `:normal`.

[getting-started-genserver]: https://hexdocs.pm/elixir/genservers.html
[elixir-school-genserver]: https://elixirschool.com/en/lessons/advanced/otp_concurrency
[genserver]: https://hexdocs.pm/elixir/GenServer.html
[use]: https://hexdocs.pm/elixir/Kernel.html#use/2
[impl]: https://hexdocs.pm/elixir/Module.html#module-impl
[start-link]: https://hexdocs.pm/elixir/GenServer.html#start_link/3
[call]: https://hexdocs.pm/elixir/GenServer.html#call/2
[cast]: https://hexdocs.pm/elixir/GenServer.html#cast/2
[init]: https://hexdocs.pm/elixir/GenServer.html#c:init/1
[handle-call]: https://hexdocs.pm/elixir/GenServer.html#c:handle_call/3
[handle-cast]: https://hexdocs.pm/elixir/GenServer.html#c:handle_cast/2
[handle-info]: https://hexdocs.pm/elixir/GenServer.html#c:handle_info/2
[keyword-get]: https://hexdocs.pm/elixir/Keyword.html#get/3
[case]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2
