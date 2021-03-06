# About

- mention how tasks send messages and how calling receive messed up the task
- task await_many in Elixir 11.1 vs Enum map task await
> Because the await calls happen sequentially, the timeout is reset for each element of the list. This can lead to unexpected and likely unwanted behavior in which this call may block much longer than the specified timeout.

https://elixirforum.com/t/new-function-task-await-many/27364
