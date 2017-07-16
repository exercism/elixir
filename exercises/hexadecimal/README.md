# Hexadecimal

Convert a hexadecimal number, represented as a string (e.g. "10af8c"), to its decimal equivalent using first principles (i.e. no, you may not use built-in or external libraries to accomplish the conversion).

On the web we use hexadecimal to represent colors, e.g. green: 008000,
teal: 008080, navy: 000080).

The program should handle invalid hexadecimal strings.

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

## Source

All of Computer Science [http://www.wolframalpha.com/examples/NumberBases.html](http://www.wolframalpha.com/examples/NumberBases.html)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
