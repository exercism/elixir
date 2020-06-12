While working at _Instruments of Texas_, you are tasked to work on an experimental calculator written in Elixir. Your team is having a problem with some operations raising errors and crashing the process. You have been tasked to write a function which wraps the operation function so that the errors can be handled more elegantly with idiomatic Elixir code.

## 1. Warn the team

Implement the function `calculate!/2` to call the operation function with the stack as the only argument. The operation function is defined elsewhere, but you know that it can either complete successfully or raise an error.

```elixir
stack = []
operation = fn _ -> :ok end
RPNCalculator.calculate!(stack, operation)
# => :ok

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate!(stack, operation)
# => ** (ArgumentError) An error occurred
```

> Function names that end in `!` are a warning to programmers that this function may raise an error

## 2. Wrap the error

When doing more research you notice that many functions use atoms and tuples to indicate their success/failure. Implement `calculate/2` using this strategy.

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate!(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate!(stack, operation)
# => :error
```

## 3. Pass on the message

Some of the errors contain important information that your coworkers need to have to ensure the correct operation of the system. Implement `calculate_verbose/2` to pass on the error message.

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate!(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate!(stack, operation)
# => {:error, "An error occurred"}
```
