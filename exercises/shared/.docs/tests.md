# Running tests

Tests are written in test files and placed in the `test` directory and defined
by:

```elixir
test "short test description" do
  ... test implementation ...
end
```

All tests may be executed with:

```bash
$ mix test
```

Useful references include:

* Elixir's unit test library: https://hexdocs.pm/ex_unit/ExUnit.html
* Mix's test task support: https://hexdocs.pm/mix/Mix.Tasks.Test.html

ExUnit and mix provides quite a few methods of grouping, tagging and executing
different groups and tags of tests which are detailed below.

## Running tests in a specific file

All tests in a single file may be executed via `mix test` by specifying the file:

```bash
$ mix test test/<FILE>.ex
```

> NOTE: `tagging` may impact which tests are actually executed using this method.

### Running individual tests

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

## Grouping tests

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

## Pending tests

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
