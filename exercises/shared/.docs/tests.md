# Running tests

From the terminal, change to the base directory of the exercise then execute the tests with:

```bash
$ mix test
```

This will execute the test file found in the `test` subfolder -- a file ending in `_test.exs`

Documentation:

* [`mix test` - Elixir's test execution tool](https://hexdocs.pm/mix/Mix.Tasks.Test.html)
* [`ExUnit` - Elixir's unit test library](https://hexdocs.pm/ex_unit/ExUnit.html)

## Pending tests

In test suites of practice exercises, all but the first test have been tagged to be skipped.

Once you get a test passing, you can unskip the next one by commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

If you wish to run all tests at once, you can include all skipped test by using the `--include` flag on the `mix test` command:

```bash
$ mix test --include pending
```

Or, you can enable all the tests by commenting out the `ExUnit.configure` line in the file `test/test_helper.exs`.

```elixir
# ExUnit.configure(exclude: :pending, trace: true)
```

## Useful `mix test` options

* `test/<FILE>.exs:LINENUM` - runs only a single test, the test from `<FILE>.exs` whose definition is on line `LINENUM`
* `--failed` - runs only tests that failed the last time they ran
* `--max-failures` - the suite stops evaluating tests when this number of test failures
is reached
* `--seed 0` - disables randomization so the tests in a single file will always be ran
in the same order they were defined in
