# Instructions

The basic Take-A-Number machine was selling really well, but some users were complaining about its lack of advanced features compared to other models available on the market.

The manufacturer listened to user feedback and decided to release a deluxe model with more features, and you once again were tasked with writing the software for this machine.

The new features added to the deluxe model include:
- Keeping track of currently queued numbers.
- Setting the minimum and maximum number. This will allow using multiple deluxe Take-A-Number machines for queueing customers to different departments at the same facility, and to tell apart the departments by the number range.
- Allowing certain numbers to skip the queue to provide priority service to pregnant women and the elderly.
- Auto shutdown to prevent accidentally leaving the machine on for the whole weekend and wasting energy.

The business logic of the machine was already implemented by your colleague and can be found in the module `TakeANumberDeluxe.State`. Now your task is to wrap it in a `GenServer`.

## 1. Start the machine

Use the `GenServer` behaviour in the `TakeANumberDeluxe` module.

Implement the `start_link/1` function and the necessary `GenServer` callback.

The argument passed to `start_link/1` is a keyword list. It contains the keys `:min_number` and `:max_number`. The values under those keys need to be passed to the function `TakeANumberDeluxe.State.new/2`.

If `TakeANumberDeluxe.State.new/2` returns an `{:ok, state}` tuple, the machine should start, using the returned state as its state. If it returns an `{:error, error}` tuple instead, the machine should stop, giving the returned error as the reason for stopping.

```elixir
TakeANumberDeluxe.start_link(min_number: 1, max_number: 9)
# => {:ok, #PID<0.174.0>}

TakeANumberDeluxe.start_link(min_number: 9, max_number: 1)
# => {:error, :invalid_configuration}
```

You might have noticed that the function `TakeANumberDeluxe.State.new/2` also takes an optional third argument, `auto_shutdown_timeout`. We will use it in the last step of this exercise.

## 2. Report machine state

Implement the `report_state/1` function and the necessary `GenServer` callback. The machine should reply to the caller with its current state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.report_state(machine)
# => %TakeANumberDeluxe.State{
#      max_number: 10,
#      min_number: 1,
#      queue: %TakeANumberDeluxe.Queue{in: [], out: []},
#      auto_shutdown_timeout: :infinity,
#    }
```

## 3. Queue new numbers

Implement the `queue_new_number/1` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.queue_new_number/1` function with the current state of the machine.

If `TakeANumberDeluxe.State.queue_new_number/1` returns an `{:ok, new_number, new_state}` tuple, the machine should reply to the caller with the new number and set the new state as its state. If it returns a `{:error, error}` tuple instead, the machine should reply to the caller with the error and not change its state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 2)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 2}

TakeANumberDeluxe.queue_new_number(machine)
# => {:error, :all_possible_numbers_are_in_use}
```

## 4. Serve next queued number

Implement the `serve_next_queued_number/2` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.serve_next_queued_number/2` function with the current state of the machine and its second optional argument, `priority_number`.

If `TakeANumberDeluxe.State.serve_next_queued_number/2` returns an `{:ok, next_number, new_state}` tuple, the machine should reply to the caller with the next number and set the new state as its state. If it returns a `{:error, error}` tuple instead, the machine should reply to the caller with the error and not change its state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:error, :empty_queue}
```

## 5. Reset state

Implement the `reset_state/1` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.new/2` function to create a new state using the current state's `min_number` and `max_number`. The machine should set the new state as its state. It should not reply to the caller.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)

TakeANumberDeluxe.reset_state(machine)
# => :ok
```

## 6. Implement auto shutdown

Modify starting the machine. It should read the value under the key `:auto_shutdown_timeout` in the keyword list passed as `init_arg` and pass it as the third argument to `TakeANumberDeluxe.State.new/3`. Use the default value of `:infinity` if `:auto_shutdown_timeout` was not given.

Modify resetting the machine state to also pass `auto_shutdown_timeout` to `TakeANumberDeluxe.State.new/3`.

Modify the return values of all implemented callbacks (`init/1` and all `handle_*` callbacks) to set a timeout. Use the value under the key `:auto_shutdown_timeout` in the current machine state. Do not add the timeout to the `{:stop, reason}` return value of `init/1` - timeouts only apply after the server has started its receive loop.

Implement a `GenServer` callback to handle the `:timeout` message that will be sent to the machine if it doesn't receive any other messages within the given timeout. It should exit the process with reason `:normal`.

Make sure to also handle any unexpected messages by ignoring them.

```elixir
{:ok, machine} =
  TakeANumberDeluxe.start_link(
    min_number: 1,
    max_number: 10,
    auto_shutdown_timeout: :timer.hours(2)
  )

# after 3 hours...

TakeANumberDeluxe.queue_new_number(machine)
# => ** (exit) exited in: GenServer.call(#PID<0.171.0>, :queue_new_number, 5000)
#        ** (EXIT) no process: the process is not alive or there's no process currently associated with the given name, possibly because its application isn't started
#       (elixir 1.13.0) lib/gen_server.ex:1030: GenServer.call/3
```
