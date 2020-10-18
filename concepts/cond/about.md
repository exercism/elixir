When we want to have branching code, we can use the [`cond/1`][cond] function:

```elixir
cond do
  sometimes -> :this_might_be_the_way
  other_times -> :or_that_might_be_the_way
  true -> :this_is_the_default_way
end
```

At least one clause should evaluate to `true` or a run-time error will be raised.

The `cond` conditional is usually used when there are more than two logical branches and each branch has a condition based on different variables. If all the conditions are based on the same variables, a [`case`][case] conditional is a better fit. If there are only two logical branches, use an `if` conditional instead.

[cond]: https://elixir-lang.org/getting-started/case-cond-and-if.html#cond
[case]: https://elixir-lang.org/getting-started/case-cond-and-if.html#case
