# Dominoes

Make a chain of dominoes.

Compute a way to order a given set of dominoes in such a way that they form a
correct domino chain (the dots on one half of a stone match the dots on the
neighbouring half of an adjacent stone) and that dots on the halfs of the stones
which don't have a neighbour (the first and last stone) match each other.

For example given the stones `21`, `23` and `13` you should compute something
like `12 23 31` or `32 21 13` or `13 32 21` etc, where the first and last numbers are the same.

For stones 12, 41 and 23 the resulting chain is not valid: 41 12 23's first and last numbers are not the same. 4 != 3

Some test cases may use duplicate stones in a chain solution, assume that multiple Domino sets are being used.

## Running tests

Execute the tests with:

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

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


## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
