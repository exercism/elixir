In this exercise, you've been tasked with writing the software for an encryption device that works by performing transformations on data. You need a way to flexibly create complicated functions by combining simpler functions together.

For each task, make use of a closure and return a function that can be invoked from the calling scope.

All functions should expect integer parameters. Integers are also suitable for performing bitwise operations in Elixir.

You have seven tasks:

## 1. Create an adder

Implement `Secrets.secret_add/1`, have it return a function which takes one parameter and adds it to the parameter passed in to `secret_add`.

```elixir
adder = Secrets.secret_add(2)
adder.(2)
# => 4
```

## 2. Create a subtractor

Implement `Secrets.secret_subtract/1`, have it return a function which takes one parameter and subtracts the parameter passed in to `secret_subtract`.

```elixir
subtractor = Secrets.secret_subtract(2)
subtractor.(3)
# => 1
```

## 3. Create a multiplier

Implement `Secrets.secret_multiply/1`, have it return a function which takes one parameter and multiplies it by the parameter passed in to `secret_multiply`.

```elixir
multiplier = Secrets.secret_multiply(7)
multiplier.(3)
# => 21
```

## 4. Create a divider

Implement `Secrets.secret_divide/1`, have it return a function which takes one parameter and divides it by the parameter passed in to `secret_divide`.

```elixir
divider = Secrets.secret_divide(3)
divider.(32)
# => 10
```

Make use of integer division.

## 5. Create a "and"-er

Implement `Secrets.secret_and/1`, have it return a function which takes one parameter and performs a bitwise _and_ operation to the parameter passed in to `secret_and`.

```elixir
ander = Secrets.secret_and(1)
ander.(2)
# => 0
```

## 6. Create a "xor"-er

Implement `Secrets.secret_xor/1`, have it return a function which takes one parameter and performs a bitwise _xor_ operation to the parameter passed in to `secret_xor`.

```elixir
xorer = Secrets.secret_xor(1)
xorer.(3)
# => 2
```

## 7. Create a function combiner

Implement `Secrets.secret_combine/2`, have it return a function which applies the functions parameter passed in to `secret_combine` in sequence.

```elixir
multiply = Secrets.secret_multiply(7)
divide = Secrets.secret_divide(3)
combined = Secrets.secret_combine(multiply, divide)

combined.(6)
# => 14
```
