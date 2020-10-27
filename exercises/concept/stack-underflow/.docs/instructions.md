While continuing your work at _Instruments of Texas_, there is progress being made on the elixir implementation of the RPN calculator. Your team would like to be able to raise errors that are more specific than the generic errors provided by the standard library. You are doing some research, but you have decided to implement two new errors which implement the _Exception Behaviour_.

## 1. Error for Division by Zero

Dividing a number by zero produces an undefined result, which the team decides is best represented by an error.

Implement the `DivisionByZeroError` module to have the error message: `"division by zero occurred"`

```elixir
raise DivisionByZeroError
# => ** (DivisionByZeroError) division by zero occurred
```

## 2. Error when encountering stack underflow

RPN calculators use a _stack_ to keep track of numbers before they are added. The team represents this _stack_ with a list of numbers (integer and floating-point), e.g.: `[3, 4.0]`. Each operation needs a specific number of numbers on the stack in order to perform it's calculation. When there are not enough numbers on the stack, this is called a stack underflow error. Implement the `StackUnderflowError` exception which provides a default message, and optional extra context

```elixir
raise StackUnderflowError
# => ** (StackUnderflowError) stack underflow occurred

raise StackUnderflowError, "when dividing"
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing
```

## 3. Write a dividing function

Implement the `divide/1` function which takes a stack _(list of numbers)_ and:

- raises _stack underflow_ when the stack does not contain enough numbers
- raises _division by zero_ when the divisor is 0 (note the stack of numbers is stored in the reverse order)
- performs the division when no errors are raised

```elixir
RPNCalculator.Exception.divide([])
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing

RPNCalculator.Exception.divide([0, 100])
# => ** (DivisionByZero) division by zero occurred

RPNCalculator.Exception.divide([4, 16])
# => 4
```

> Note the order of the list is reversed!
