# Palindrome Products

Detect palindrome products in a given range.

A palindromic number is a number that remains the same when its digits are
reversed. For example, `121` is a palindromic number but `112` is not.

Given the definition of a palindromic number, we define a palindrome _product_
to be the product `c`, such that `a * b = c`, where `c` is a palindromic number and
 `a` and `b` are integers (possibly, but _not_ necessarily palindromic numbers).

For example, the palindromic number 9009 can be written as the palindrome
product: `91 * 99 = 9009`.

It's possible (and indeed common) for a palindrome product to be the product
of multiple combinations of numbers. For example, the palindrome product `9` has
the factors `(1, 9)`, `(3, 3)`, and `(9, 1)`.

Write a program that given a range of integers, returns the smallest and largest
palindromic product within that range, along with all of it's factors.

## Example 1

Given the range `[1, 9]` (both inclusive)...

The smallest product is `1`. It's factors are `(1, 1)`.
The largest product is `9`. It's factors are `(1, 9)`, `(3, 3)`, and `(9, 1)`.

## Example 2

Given the range `[10, 99]` (both inclusive)...

The smallest palindrome product is `121`. It's factors are `(11, 11)`.
The largest palindrome product is `9009`. It's factors are `(91, 99)` and `(99, 91)`.

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

Problem 4 at Project Euler [http://projecteuler.net/problem=4](http://projecteuler.net/problem=4)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
