# Running Elixir tests in exercism

Elixir tests are written in `.exs` test files and placed in the `test` directory and implemented
as:

```elixir
test "short test description" do
  # test implementation
end
```

All tests may be executed with:

```bash
$ mix test
```

Useful top-level references include:

* [`ExUnit` - Elixir's unit test library](https://hexdocs.pm/ex_unit/ExUnit.html)
* [`mix test` - Elixir's test execution tool](https://hexdocs.pm/mix/Mix.Tasks.Test.html)

### Pending tagged tests

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

* [Tagging tests](https://hexdocs.pm/ex_unit/ExUnit.Case.html#module-tags)
* [Executing tagged tests](https://hexdocs.pm/mix/Mix.Tasks.Test.html#module-filters)

# Additional Elixir testing features

`ExUnit` and `mix test` provide quite a few methods of grouping, tagging & executing
tests and various methods of controlling test execution, much of which is summarized
below.

### Methods for running specific tests

`mix test` has a variety of methods of running specific and specific groups of tests.

Below is just a summary of some very useful methods.

Documentation:

* [`mix test` documentation](https://hexdocs.pm/mix/Mix.Tasks.Test.html)

##### Running tests in a specific file

All tests in a single file may be executed via `mix test` by specifying the file:

```bash
$ mix test test/<FILE>.exs
```

> NOTE: `tagging` may impact which tests are actually executed using this method.

##### Running individual tests

Individual tests may be executed by referencing a test's line number in the file:

```bash
$ mix test test/<FILE>.exs:LINENUM
```

Multiple tests may be executed by giving multiple line numbers separated by `:`.

For example, given a file with the following content with line numbers:

```elixir
test "Test 1" do           # 1
  # test implementation    # 2-6
end                        # 7
                           # 8
test "Test 2" do           # 9
  # test implementation    # 10-21
end                        # 22
                           # 23
test "Test 3" do           # 24
  # test implementation    # 25-35
end                        # 36
```

The 1st and 3rd tests can be executed by:

```bash
$ mix test test/FILE.exs:1:24
```

> NOTE: When specifying tests via line numbers, `tagging` is ignored.

##### Running groups of tests

Tests may be grouped using `describe`:

```elixir
describe "short test group description" do
  test "test description" do
    # test implementation
  end

  test "another test description" do
    # test implementation
  end
end
```

All tests in a group may be executed by referencing its line number in the file,
just like referencing and executing individual tests.

Dcumentation:

* [`describe`](https://hexdocs.pm/ex_unit/ExUnit.Case.html#describe/2)

### Controlling test execution

Independent of specifying tests to be executed, `ExUnit` and `mix test` have a number
of methods to control what tests are executed.

##### Controlling execution via `tags`

##### Controlling execution via `mix test` command-line options

A number of useful command-line options exist that control which tests are executed
based on past or current execution, such as:

* `--failed` - runs only tests that failed the last time they ran
* `--max-failures` - the suite stops evaluating tests when this number of test failures
is reached
* `--seed` - seeds the random number generator used to randomize the order of tests;
`--seed 0` disables randomization so the tests in a single file will always be ran
in the same order they were defined in
* `--stale` - runs only tests which reference modules that changed since the last
time tests were ran with `--stale`

Documentation:

* [`mix test` command-line options](https://hexdocs.pm/mix/Mix.Tasks.Test.html#module-command-line-options)
