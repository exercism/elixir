## General

- Review the official documentation:
  - [Elixir - Getting started: Structs][getting-started]
  - [Elixir - defstruct][docs-defstruct]
- Watch this short video:
  - [Elixir Casts - #106: Intro to Structs][elixir-casts]

## 1. Create a brand-new remote controlled car

- The `nickname` field should not have a default value specified.
- The `new/0` function should initialize the `nickname` with the value `"none"`.

## 2. Create a brand-new remote controlled car with a nickname

- Use [`multiple-function-clauses`][multiple-fn-clauses] to reuse the function name but accept different arguments.
- Consider a [`default-argument`][default-argument] for the function.

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

If the battery is dead, it should return the struct unchanged.

[getting-started]: https://elixir-lang.org/getting-started/structs.html
[docs-defstruct]: https://hexdocs.pm/elixir/Kernel.html#defstruct/1
[elixir-casts]: https://elixircasts.io/intro-to-structs
[multiple-fn-clauses]: https://elixir-lang.org/getting-started/modules-and-functions.html#named-functions
[default-arg]: https://elixir-lang.org/getting-started/modules-and-functions.html#default-arguments
