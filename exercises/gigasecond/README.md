# Gigasecond

Calculate the moment when someone has lived for 10^9 seconds.

A gigasecond is 10^9 (1,000,000,000) seconds.

## Running tests

Execute the tests with:

```bash
$ elixir gigasecond_test.exs
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

Chapter 9 in Chris Pine's online Learn to Program tutorial. [http://pine.fm/LearnToProgram/?Chapter=09](http://pine.fm/LearnToProgram/?Chapter=09)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
