# Two Fer

Two-fer or 2-fer is short for two for one. One for you and one for me.

````bash
$ elixir "One for X, one for me."
```

When X is a name or "you".

If the given name is "Dunk", the result should be "One for Dunk, one for me." If no name is given, the result should be "One for you, one for me."

## Running tests

Execute the tests with:

```bash
$ elixir two_fer_test.exs
```

### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

For more detailed information about the Elixir track, please
see the [help page](http://exercism.io/languages/elixir).

## Source

This is an exercise to introduce users to basic programming constructs, just after Hello World. https://en.wikipedia.org/wiki/Two-fer

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
