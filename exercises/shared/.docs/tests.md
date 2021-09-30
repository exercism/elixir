# Running tests

Tests are written in test files and placed in the `test` directory and implemented
as:

```elixir
test "short test description" do
  ... test implementation ...
end
```

All tests may be executed with:

```bash
$ mix test
```

Useful top-level references include:

* Elixir's unit test library: https://hexdocs.pm/ex_unit/ExUnit.html
* Elixir's test execution tool: https://hexdocs.pm/mix/Mix.Tasks.Test.html

`ExUnit` and `mix` provides quite a few methods of grouping, tagging & executing
tests and various methods of controlling test execution, all of which is detailed
below.

### Methods of running specific tests

`mix` has a variety of methods of running specific and specific groups of tests.

Below is just a summary of some very useful methods; full documentation is here:
https://hexdocs.pm/mix/Mix.Tasks.Test.html

##### Running tests in a specific file

All tests in a single file may be executed via `mix` by specifying the file:

```bash
$ mix test test/<FILE>.ex
```

> NOTE: `tagging` may impact which tests are actually executed using this method.

##### Running individual tests

Individual tests may be executed by referencing a test's line number in the file:

```bash
$ mix test test/<FILE>.ex:LINENUM
```

Multiple tests may be executed by giving multiple line numbers separated by `:`.

For example, given a file with the following content with line numbers:

```elixir
1:      test "Test 1" do
2-6:      . . .
7:      end
8:
9:      test "Test 2" do
10-21:    . . .
22:     end
23:
24:     test "Test 3" do
25-35:    . . .
36:     end
```

The 1st and 3rd tests can be executed by:

```bash
$ mix test test/FILE.ex:1:24
```

> NOTE: When specifying tests via line numbers, `tagging` is ignored.

##### Running groups of tests

Tests may be grouped using `describe`:

```elixir
describe "short test group description" do
  test ... do
    ...
  end

  test ... do
    ...
  end
end
```

All tests in a group may be executed by referencing its line number in the file,
just like referencing and executing individual tests.

Documentation: https://hexdocs.pm/ex_unit/ExUnit.Case.html#describe/2

### Controlling test execution

Independent of specifying tests to be executed, `ExUnit` and `mix` have a number
of methods to control what tests are executed.

##### Controlling execution via `tags`

In many test suites, all but the first test have been tagged to be skipped.

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

Documentation:

* `ExUnit`: https://hexdocs.pm/ex_unit/ExUnit.Case.html#module-tags
* `mix`: https://hexdocs.pm/mix/Mix.Tasks.Test.html#module-filters

##### Controlling execution via `mix test` command-line options

A number of useful command-line options exist that control which tests are executed
based on past or current execution, such as:

* `--failed`: runs only tests that failed the last time they ran
* `--max-failures`: the suite stops evaluating tests when this number of test failures
is reached.
* `--seed`: seeds the random number generator used to randomize the order of tests;
`--seed 0` disables randomization so the tests in a single file will always be ran
in the same order they were defined in
* `--stale`: runs only tests which reference modules that changed since the last
time tests were ran with `--stale`

Documentation: https://hexdocs.pm/mix/Mix.Tasks.Test.html#module-command-line-options
