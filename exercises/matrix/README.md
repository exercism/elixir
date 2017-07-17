# Matrix

Given a string representing a matrix of numbers, return the rows and columns of
that matrix.

So given a string with embedded newlines like:

> 9 8 7  
> 5 3 2  
> 6 6 7  

representing this matrix:

```plain
    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2
2 | 6  6  7
```

your code should be able to spit out:

- A list of the rows, reading each row left-to-right while moving
  top-to-bottom across the rows,
- A list of the columns, reading each column top-to-bottom while moving
  from left-to-right.

The rows for our example matrix:

- 9, 8, 7
- 5, 3, 2
- 6, 6, 7

And its columns:

- 9, 5, 6
- 8, 3, 6
- 7, 2, 7

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

Warmup to the `saddle-points` warmup. [http://jumpstartlab.com](http://jumpstartlab.com)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
