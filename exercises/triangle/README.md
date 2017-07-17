# Triangle

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.<br/>
An _isosceles_ triangle has at least two sides the same length. (It is sometimes
specified as having exactly two sides the same length, but for the purposes of
this exercise we'll say at least two.)<br/>
A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and 
the sum of the lengths of any two sides must be greater than or equal to the 
length of the third side. See [Triangle Inequality](https://en.wikipedia.org/wiki/Triangle_inequality).

## Dig Deeper

The case where the sum of the lengths of two sides _equals_ that of the 
third is known as a _degenerate_ triangle - it has zero area and looks like 
a single line. Feel free to add your own code/tests to check for degenerate triangles.
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

The Ruby Koans triangle project, parts 1 & 2 [http://rubykoans.com](http://rubykoans.com)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
