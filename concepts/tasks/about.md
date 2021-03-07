# About

Tasks are processes meant to execute one specific operation.
They usually don't communicate with other processes, but they can return a result to the process that started the task.

Tasks are commonly used to parallelize work.

## `async`/`await`

To start a task, use `Task.async/1`. It takes an anonymous function as an argument and executes it in a new process that is linked to the caller process. It returns a `%Task{}` struct.

To get the result of the execution, pass the `%Task{}` struct to `Task.await/2`. It will wait for the task to finish and return its result. The second argument is a timeout in milliseconds, defaulting to 5000.

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

Note that between starting the task and awaiting on the task, the process that started the task is not blocked and might do other operations.

Any task started with `Task.async/1` should be awaited on because it will send a message to the calling process. `Task.await/2` can be called for each task only once.

## `start`/`start_link`

If you want to start a task for side-effects only, use `Task.start/1` or `Task.start_link/1`. `Task.start/1` will start a task that is not linked to the calling process, and `Task.start_link/1` will start a task that is linked to the calling process. Both functions return a `{:ok, pid}` tuple.


TODO:
- mention how tasks send messages and how calling receive messed up the task
- task await_many in Elixir 11.1 vs Enum map task await
> Because the await calls happen sequentially, the timeout is reset for each element of the list. This can lead to unexpected and likely unwanted behavior in which this call may block much longer than the specified timeout.

https://elixirforum.com/t/new-function-task-await-many/27364
