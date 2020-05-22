## General

- Make use of [anonymous functions][anon-fns].
- Use a [closure][closure] to reference the variable from the outer scope.

## 1. Create an adder

- Return an anonymous function which adds the parameter from the anonymous function to the parameter passed in to `Secret.secret_add/1`

## 2. Create a subtractor

- Return an anonymous function which subtracts the parameter passed in to `Secret.secret_subtract/1` from the parameter from the anonymous function.

## 3. Create a multiplier

- Return an anonymous function which multiplies the parameter from the anonymous function to the parameter passed in to `Secret.secret_multiply/1`

## 4. Create a divider

- return an anonymous function which divides the parameter from the anonymous function by the parameter passed in to `Secret.secret_divide/1`
- make use of [integer division][div]

## 5. Create an "and"-er

- Return an anonymous function which performs a [bitwise _and_][bitwise-wiki] operation using the parameter passed in to the anonymous function and the parameter passed in to `Secret.secret_and/1`
- functions in the [Bitwise module][bitwise-hexdocs] may be of use.

## 6. Create an "xor"-er

- Return an anonymous function which performs a [bitwise _xor_][bitwise-wiki] operation using the parameter passed in to the anonymous function and the parameter passed in to `Secret.secret_xor/1`
- functions in the [Bitwise module][bitwise-hexdocs] may be of use.

## 7. Create a function combiner

- Return an anonymous function which [composes the functions][fn-composition] passed in to `Secret.secret_combine/2`

[anon-fns]: https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions
[bitwise-hexdocs]: https://hexdocs.pm/elixir/Bitwise.html
[bitwise-wiki]: https://en.wikipedia.org/wiki/Bitwise_operation
[closure]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
[div]: https://hexdocs.pm/elixir/Kernel.html#div/2
[fn-composition]: https://en.wikipedia.org/wiki/Function_composition
