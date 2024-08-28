# Instructions

You are a huge fan of the [Numberphile Youtube channel](https://www.youtube.com/watch?v=PeUbRXnbmms) and you just saw a cool video about the _Lucas Number Sequence_. You want to create this sequence using Elixir.

While designing your function, you want to make use of _lazy evaluation_, so that you can generate as many numbers as you want, but only if you need to -- So you decide to use a stream.

## 1. Catch bad arguments

Add a guard clause to raise an error if a non-integer or an integer less than 1 is used to generate the sequence. Doing this as the first step will prevent infinite recursion bugs in later steps.

```elixir
LucasNumbers.generate("Hello World")
# => ** (ArgumentError) count must be specified as an integer >= 1
```

## 2. Generate the base cases

You know that the sequence has two starting numbers which don't follow the same rule. Write two base case clauses to return these numbers:

```elixir
LucasNumbers.generate(1)
# => [2]

LucasNumbers.generate(2)
# => [2, 1]
```

## 3. Create the generalized case

For any sequence longer than 2, you know that you need to add the previous two numbers to get the next number and so on. Write the generalized case.

```elixir
LucasNumbers.generate(3)
# => [2, 1, 3]

LucasNumbers.generate(4)
# => [2, 1, 3, 4]
```
