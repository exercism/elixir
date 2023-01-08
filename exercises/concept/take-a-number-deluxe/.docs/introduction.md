# Introduction

## GenServer

`GenServer` (generic server) is a [behaviour][concept-behaviours] that abstracts common client-server interactions between Elixir processes.

Remember the receive loop from when we learned about [processes][concept-processes]? The `GenServer` behaviour provides abstractions for implementing such loops, and for exchanging messages with a process that runs such a loop. It makes it easier to keep state and execute asynchronous code.

~~~~exercism/note
Be warned that the name `GenServer` is loaded. It is also used to describe a _module_ that _uses_ the `GenServer` behaviour, as well as a _process_ that was started from a module that _uses_ the `GenServer` behaviour.
~~~~

The `GenServer` behaviour defines one required callback, `init/1`, and a few interesting optional callbacks: `handle_call/3`, `handle_cast/2`, and `handle_info/3`. The _clients_ using a `GenServer` aren't supposed to call those callbacks directly. Instead, the `GenServer` module provides functions that clients can use to communicate with a `GenServer` process.

Often, a single module defines both a _client API_, a set of functions that other parts of your Elixir app can call to communicate with this `GenServer` process, and _server callback implementations_, which contain this `GenServer`'s logic.

Let's take a look at a simple example of a `GenServer` first, and then learn what each callback means.

### Example

This is an example server that can respond to the repetitive inquisitions of annoying passengers during a long road trip, more exactly the question: "are we there yet?". It keeps track of how many times this question has been asked, returning increasingly more annoyed responses.

```elixir
defmodule AnnoyingPassengerAutoresponder do
  use GenServer
  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def are_we_there_yet?(pid) do
    GenServer.call(pid, :are_we_there_yet?)
  end

  # Server callbacks

  @impl GenServer
  def init(_init_arg) do
    # the initial count of questions asked is always 0
    state = 0
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:are_we_there_yet?, _from, state) do
    reply =
      cond do
        state <= 3 -> "No."
        state <= 10 -> "I told you #{state} times already. No."
        true -> "..."
      end

    # increase the count of questions asked
    new_state = state + 1
    # reply to the caller
    {:reply, reply, new_state}
  end
end
```

### Callbacks

#### `init/1`

A server can be started by calling `GenServer.start/3` or `GenServer.start_link/3`. We learned about the difference between those functions in the [links concept][concept-links].

Those two functions:

- Accept a module implementing the `GenServer` behaviour as the first argument.
- Accept anything as the second argument called `init_arg`. As the name suggest, this argument gets passed to the `init/1` callback.
- Accept an optional third argument with advanced options for running the process that we won't cover now.

Starting a server by calling `GenServer.start/3` or `GenServer.start_link/3` will invoke the `init/1` callback in a blocking way. The return value of `init/1` dictates if the server can be started successfully.

The `init/1` callback usually returns one of those values:

- `{:ok, state}`. The server will start its receive loop using `state` as its initial state. `state` can be of any type.
- `{:stop, reason}`. `reason` can be of any type. The server will not start its receive loop. The process will exit with the given reason.

There are also more advanced possibilities that we won't cover now.

If the server's receive loop starts, the functions `GenServer.start/3` and `GenServer.start_link/3` return an `{:ok, pid}` tuple. Otherwise they return `{:error, reason}`

#### `handle_call/3`

A message that requires a reply can be sent to a server process with `GenServer.call/2`. This function expects the `pid` of a running server process as the first argument, and the message as the second argument. The message can be of any type.

The `handle_call/3` callback is responsible for handling and responding to synchronous messages. It receives three arguments:

1. `message` - the value passed as the second argument to `GenServer.call/2`.
2. `from` - the `pid` of the process calling `GenServer.call/2`. Most often this argument can be ignored.
3. `state` - the current state of the server. Remember that its initial value was set in the `init/1` callback.

The `handle_call/3` callback usually returns a 3 tuple of `{:reply, reply, state}`. This means that the second element in the tuple, a `reply` that can be of any type, will be sent back to the caller. The third element in the tuple, `state`, is the new state of the server after handling this message.

There are also more advanced possibilities that we won't cover now.

~~~~exercism/note
To memorize what this callback does by its name,
think of it as "calling" somebody on the phone.

If that person is available, you'll receive a reply immediately (synchronously).
~~~~

#### `handle_cast/2`

A message that doesn't require a reply can be sent to a server process with `GenServer.cast/2`. Its arguments are identical to those of `GenServer.call/2`.

The `handle_cast/2` callback is responsible for handling those messages. It receives two arguments, `message` and `state`, which are the same arguments as in the `handle_call/3` callback (except for `from`).

The `handle_cast/2` callback usually returns a 2 tuple of `{:noreply, state}`.

There are also more advanced possibilities that we won't cover now.

~~~~exercism/note
To memorize what this callback does by its name,
remember that "to cast" also means "to throw".

If you throw a message in a bottle into the sea,
you don't expect to receive a reply immediately,
or maybe ever.
~~~~

#### Should I use `call` or `cast`?

Almost always use `call` even if your client code doesn't need the reply from the server.

Using `call` waits for the reply, which serves as a backpressure mechanism (to prevent clients from sending too many messages at once). Receiving a reply from the server is also the only way to be sure that the server received and handled the client's message.

#### `handle_info/2`

Messages can also end up in the server's inbox by means other than calling `GenServer.call/2` or `GenServer.cast/2`, for example calling the plain `send/2` function.

To handle such messages, use the `handle_info/2` callback. This callback works in exactly the same way as `handle_cast/2`.

The `GenServer` behaviour provides a catch-all implementation of `handle_info/2` that logs errors about unexpected messages. If you override that default implementation, make sure to always include your own catch-all implementation. If you forget, the server will crash if it receives an unexpected message.

### Timeouts

The return value of each of the four callbacks described above can be extended by one more tuple element, a timeout. E.g. instead of returning `{:ok, state}` from `init/1`, return `{:ok, state, timeout}`.

The timeout can be used to detect a lack of messages in the mailbox for a specific period. If the server returns a timeout from one of its callbacks, and the specified number of milliseconds have elapsed with no message arriving, `handle_info/2` is called with `:timeout` as the first argument.

[concept-behaviours]: https://exercism.org/tracks/elixir/concepts/behaviours
[concept-processes]: https://exercism.org/tracks/elixir/concepts/processes
[concept-links]: https://exercism.org/tracks/elixir/concepts/links
