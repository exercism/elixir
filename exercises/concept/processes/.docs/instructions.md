You are writing an embedded system for a Take-A-Number machine. It is a very simple model. It can give out consecutive numbers and report what was the last number given out.

## 1. Start the machine

Implement the `start/0` function. It should spawn a new process that has an initial state of `0` and is ready to receive messages. It should return the process' PID.

```elixir
TakeANumber.start()
# => #PID<0.138.0>
```

Note that each time you run this code, the PID may be different.

## 2. Report the machine state

Modify the machine so that it can receive `{:report_state, sender_pid}` messages. It should send its current state (the last given out ticket number) to `sender_pid` and then wait for more messages.

```elixir
machine_pid = TakeANumber.start()
send(machine_pid, {:report_state, self()})

receive do
  msg -> msg
end
# => 0
```

## 3. Give out numbers

Modify the machine so that it can receive `{:take_a_number, sender_pid}` messages. It should increase its state by 1, send the new state to `sender_pid`, and then wait for more messages.

```elixir
machine_pid = TakeANumber.start()
send(machine_pid, {:take_a_number, self()})

receive do
  msg -> msg
end
# => 1
```

## 4. Stop the machine

Modify the machine so that it can receive a `:stop` message. It should stop waiting for more messages.

## 5. Ignore unexpected messages

Modify the machine so that when it receives an unexpected message, it ignores it and continues waiting for more messages.
