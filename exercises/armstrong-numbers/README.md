# Armstrong Numbers

An [Armstrong number](https://en.wikipedia.org/wiki/Narcissistic_number) is a number that is the sum of its own digits each raised to the power of the number of digits.

For example:

- 9 is an Armstrong number, because `9 = 9^1 = 9`
- 10 is *not* an Armstrong number, because `10 != 1^2 + 0^2 = 1`
- 153 is an Armstrong number, because: `153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153`
- 154 is *not* an Armstrong number, because: `154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190`

Write some code to determine whether a number is an Armstrong number.

## Running tests

Execute the tests with:

```bash
$ mix test
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

If you're stuck on something, it may help to look at some of
the [available resources](https://exercism.io/tracks/elixir/resources)
out there where answers might be found.

## Source

Wikipedia [https://en.wikipedia.org/wiki/Narcissistic_number](https://en.wikipedia.org/wiki/Narcissistic_number)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
