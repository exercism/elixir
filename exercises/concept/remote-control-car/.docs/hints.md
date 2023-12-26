# Hints

## General

- Read about [structs][getting-started-structs] in the Getting Started guide.
- Read about [`defstruct`][docs-defstruct] in the documentation.
- Watch [Elixir Casts - #106: Intro to Structs][elixir-casts].

## 1. Create a brand-new remote controlled car

- The module attribute `@enforce_keys` can be used to specify required values. It needs to be defined before calling `defstruct`.
- The `nickname` field should not have a default value specified.
- The `new/0` function should initialize the `nickname` with the value `"none"`.

## 2. Create a brand-new remote controlled car with a nickname

- Use [`multiple-function-clauses`][multiple-fn-clauses] to reuse the function name but accept different arguments.
- Consider a [`default-argument`][default-arg] for the function.

## 3. Display the distance

- For functions which accept only a specific type of struct, make sure you perform a pattern match to check the argument.
- Use the _static access operator_ to obtain field values.

## 4. Display the battery percentage

- For functions which accept only a specific type of struct, make sure you perform a pattern match to check the argument.
- Use the _static access operator_ to obtain field values.

## 5. Driving changes the battery and distance driven

- For functions which accept only a specific type of struct, make sure you perform a pattern match to check the argument.
- Use the _static access operator_ to obtain field values.
- Review the introduction for updating structs.

## 6. Account for driving with a dead battery

- If the battery is dead, it should return the struct unchanged.

[getting-started-structs]: https://hexdocs.pm/elixir/structs.html
[docs-defstruct]: https://hexdocs.pm/elixir/Kernel.html#defstruct/1
[elixir-casts]: https://elixircasts.io/intro-to-structs
[multiple-fn-clauses]: https://hexdocs.pm/elixir/modules-and-functions.html#function-definition
[default-arg]: https://hexdocs.pm/elixir/modules-and-functions.html#default-arguments
