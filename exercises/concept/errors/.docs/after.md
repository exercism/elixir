## Errors

While Elixir programmers often say ["let it crash"][let-it-crash] and code for the ["happy path"][happy-path], there are often times we need to rescue the function call to return a specific value, message or release system resources.

- Functions that raise errors under normal circumstances are to have `!` at the end of their name.
- Functions may also alternatively return atoms and tuples to indicate success and failure:

  ```elixir
  Map.fetch(%{a: 1}, :a)
  # => {:ok, 1}
  Map.fetch(%{a: 1}, :b)
  # => :error

  Map.fetch!(%{a: 1}, :b)
  # => raises KeyError
  ```

## Try .. Rescue

- [`try .. rescue`][docs-try] can be used to capture and evaluate errors that are raised inside the block.
- Let's review the previous example:

  ```elixir
  try do                             #1
    raise RuntimeError, "error"      #2
  rescue
    e in RuntimeError -> :error      #3
  end
  ```

  - **Line 1**, the block is declared with `try`
  - **Line 2**, the function call which may error is placed here, in this case we are calling `raise/1`
  - **Line 3**, in the `rescue` section, we pattern match on the _Module_ name of the error raised
    - on the left side of `->`:
      - `e` is matched to the error struct
      - `in` is a keyword in this occurrence
      - `RuntimeError` is the module to matched, but can match on any error module, or `_` all errors.
    - on the right side:
      - the instructions to be executed if the error matches

## Avoid anti-patterns

- Avoid programming patterns that use errors to control logical flow. This is an anti-pattern in Elixir.

  ```elixir
  # Avoid using errors for control-flow.
  try do
    {:ok, value} = MyModule.janky_function()
    "All good! #{value}."
  rescue
    e in RuntimeError ->
      reason = e.message
      "Uh oh! #{reason}."
  end

  # Rather, use control-flow structures for control-flow.
  case MyModule.janky_function() do
    {:ok, value} -> "All good! #{value}."
    {:error, reason} -> "Uh oh! #{reason}."
  end
  ```

## To raise, or not to raise, that is the question

As it's written in [Elixir's getting started guide][getting-started]:

> It’s up to your application to decide if an error while [performing an action] is exceptional or not. That’s why Elixir doesn’t impose exceptions on [...] functions. Instead, it leaves it up to the developer to choose the best way to proceed.

[getting-started]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html
[errors]: https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors
[docs-try]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#try/1
[let-it-crash]: https://www.amberbit.com/blog/2019/7/26/the-misunderstanding-of-let-it-crash/
[happy-path]: https://en.wikipedia.org/wiki/Happy_path
