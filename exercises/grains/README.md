# Grains

Calculate the number of grains of wheat on a chessboard given that the number
on each square doubles.

There once was a wise servant who saved the life of a prince. The king
promised to pay whatever the servant could dream up. Knowing that the
king loved chess, the servant told the king he would like to have grains
of wheat. One grain on the first square of a chess board. Two grains on
the next. Four on the third, and so on.

There are 64 squares on a chessboard.

Write code that shows:
- how many grains were on each square, and
- the total number of grains


## For bonus points

Did you get the tests passing and the code clean? If you want to, these
are some additional things you could try:

- Optimize for speed.
- Optimize for readability.

Then please share your thoughts in a comment on the submission. Did this
experiment make the code better? Worse? Did you learn anything from it?

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

JavaRanch Cattle Drive, exercise 6 [http://www.javaranch.com/grains.jsp](http://www.javaranch.com/grains.jsp)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
