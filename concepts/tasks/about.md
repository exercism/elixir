# About

Tasks are processes meant to execute one specific operation.
They usually don't communicate with other processes, but they can return a result to the process that started the task.

Tasks are commonly used to parallelize work.

## `async`/`await`

To start a task, use [`Task.async/1`][task-async]. It takes an anonymous function as an argument and executes it in a new process that is linked to the caller process. It returns a [`%Task{}` struct][task-struct].

To get the result of the execution, pass the `%Task{}` struct to [`Task.await/2`][task-await]. It will wait for the task to finish and return its result. The second argument is a timeout in milliseconds, defaulting to 5000. The value `:infinity` can be passed as a timeout to allow the task to execute without a timeout.

```elixir
task = Task.async(fn -> Enum.sum(0..999_999) end)
# => %Task{
#      owner: #PID<0.110.0>,
#      pid: #PID<0.119.0>,
#      ref: #Reference<0.3715954046.815529991.83334>
#    }

Task.await(task)
# => 499999500000
```

Note that between starting the task and awaiting the task, the process that started the task is not blocked and might do other operations.

Any task started with `Task.async/1` should be awaited because it will send a message to the calling process. `Task.await/2` can be called for each task only once.

## `start`/`start_link`

If you want to start a task for side-effects only, use [`Task.start/1`][task-start] or [`Task.start_link/1`][task-start-link]. `Task.start/1` will start a task that is not linked to the calling process, and `Task.start_link/1` will start a task that is linked to the calling process. Both functions return a `{:ok, pid}` tuple.

## Timeouts

It's a common pattern to start async tasks and then await them using `Enum.map/2` like so:

```elixir
inputs
|> Enum.map(&Task.async(fn -> function.(&1) end))
|> Enum.map(&Task.await(&1, 1_000))
```

It's important to be aware that `Task.await` is synchronous, and every time it is called, it starts its timeout clock from 0. That means that when it's used in this way, sequentially, the timeouts add up.

The first task that is awaited will run no longer than the timeout, but the second task that is awaited will get to run for however long the first task ran, plus the timeout.

Consider a situation where each task takes a little bit longer to run than the previous one, but the difference in task run duration is smaller than the await timeout.

```elixir
inputs = 1..10
function = fn n -> :timer.sleep(n * 900) && n end
```

We can use [`:timer.tc/1`][erlang-timer-tc], an Erlang function, to measure how long those tasks will run, in **micro**seconds.

```elixir
:timer.tc(fn ->
  inputs
  |> Enum.map(&Task.async(fn -> function.(&1) end))
  |> Enum.map(&Task.await(&1, 1_000))
end)

# => {9004517, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
```

9004517 microseconds is 9 seconds, much more than the given timeout of 1 second (1000 milliseconds).

If this is the behavior you want - great, go for it! If not, the alternative is to use either [`Task.async_stream/3`][task-async-stream] or [`Task.await_many/2`][task-await-many].

### `Task.async_stream/3`

[`Task.async_stream/3`][task-async-stream] allows you to run the same function for many different inputs, each in its own task. The tasks are linked to the current process, just like when run with `Task.async/1`. It returns a stream.

It accepts a timeout that applies to every task separately. Consider the same inputs and the same function used with `Task.async_stream/3`:

```elixir
inputs
|> Task.async_stream(function, timeout: 1_000)
|> Enum.to_list()

# => ** (exit) exited in: Task.Supervised.stream(1000)
#       ** (EXIT) time out
#       (elixir 1.11.3) lib/task/supervised.ex:304: Task.Supervised.stream_reduce/7
#       (elixir 1.11.3) lib/enum.ex:3473: Enum.reverse/1
#       (elixir 1.11.3) lib/enum.ex:3066: Enum.to_list/1
```

`Task.async_stream/3` is great if you have a single function to run with different inputs. It provides a lot of control by accepting other useful options, like how many tasks to run at the same time and what to do on task timeout.

If you need to run tasks that perform different operations, you might need `Task.await_many/2` instead.

### `Task.await_many/2`

[`Task.await_many/2`][task-await-many] was introduced in Elixir 1.11. It allows you to await many tasks with a shared timeout. Consider the same inputs and the same function used with `Task.await_many/2`:

```elixir
inputs
|> Enum.map(&Task.async(fn -> function.(&1) end))
|> Task.await_many(1_000)
# => ** (exit) exited in: Task.await_many([...], 1000)
#        ** (EXIT) time out
#        (elixir 1.11.3) lib/task.ex:725: Task.await_many/5
#        (elixir 1.11.3) lib/task.ex:709: Task.await_many/2
```

[erlang-timer-tc]: https://www.erlang.org/doc/man/timer.html#tc-1
[task-await-many]: https://hexdocs.pm/elixir/Task.html#await_many/2
[task-async-stream]: https://hexdocs.pm/elixir/Task.html#async_stream/3
[task-async]: https://hexdocs.pm/elixir/Task.html#async/1
[task-await]: https://hexdocs.pm/elixir/Task.html#await/2
[task-struct]: https://hexdocs.pm/elixir/Task.html#__struct__/0
[task-start]: https://hexdocs.pm/elixir/Task.html#start/1
[task-start-link]: https://hexdocs.pm/elixir/Task.html#start_link/1
