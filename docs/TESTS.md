# Running tests

From the terminal, change to the base directory of the exercise then execute the tests with:

```bash
$ mix test
```

This will execute the test file found in the `test` subfolder -- a file ending in `_test.exs`

## Pending tests

In test suites of practice exercises, all but the first test have been tagged to be skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

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

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

## Additional Elixir testing features

`ExUnit` and `mix test` provide quite a few methods of grouping, tagging & executing
tests and various methods of controlling test execution, much of which is summarized
below.

### Methods for running specific tests

Documentation:

* [`mix test` documentation](https://hexdocs.pm/mix/Mix.Tasks.Test.html)

#### Running tests in a specific file

All tests in a single file may be executed via `mix test` by specifying the file:

```bash
$ mix test test/<FILE>.exs
```

> NOTE: `tagging` may impact which tests are actually executed using this method.

#### Running individual tests

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

#### Running groups of tests

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

Documentation:

* [`describe`](https://hexdocs.pm/ex_unit/ExUnit.Case.html#describe/2)

#### Other useful `mix test` options

* `--include` and `--exclude` - runs or doesn't run specific tests based on their `@tag`s
* `--failed` - runs only tests that failed the last time they ran
* `--max-failures` - the suite stops evaluating tests when this number of test failures
  is reached
* `--seed` - seeds the random number generator used to randomize the order of tests
  `--seed 0` disables randomization so the tests in a single file will always be ran
  in the same order they were defined in
* `--stale` - runs only tests which reference modules that changed since the last
  time tests were ran with `--stale`

Documentation:

* [`mix test` command-line options](https://hexdocs.pm/mix/Mix.Tasks.Test.html#module-command-line-options)

## Typespecs and Dialyzer (DIscrepancy AnalYZer for ERlang programs)

Elixir exercises include a skeleton implementation file in the `lib`
subdirectory. This file outlines the module and functions that you are
expected to implement. In most exercises, you will find typespecs
above the function declaration. These start with the `@spec` tag and
typically follow the `@spec function_name(type1, type2) :: return_type`
format. These are used in Elixir and Erlang as documentation and
in conjunction with a tool called Dialyzer to find type inconsistencies
and possible bugs. For more information see the
[Elixir typespecs guide](http://elixir-lang.org/getting-started/typespecs-and-behaviours.html)
or the [typespecs documentation](https://hexdocs.pm/elixir/typespecs.html). For
documentation about Dialyzer see [Erlang -- dialyzer](http://erlang.org/doc/man/dialyzer.html).

Optionally, you may want to check
the types of your implementation with Dialyzer. There are a couple
of steps you will need to take. In order to do that, you must add the `Dialyxir`
dependency to the `mix.exs` file for your problem.

```elixir
defp deps do
  [{:dialyxir, "~> 0.4", only: [:dev]}] # <-- Add this
end
```

Then use mix tasks to get and compile from the command line:

```bash
$ mix deps.get
...
$ mix deps.compile
...
```

If this is the first time you have run Dialyzer you
will most likely not have a `plt` file. The persistent lookup table,
or PLT is used by Dialyzer to cache information about built in Elixir
and Erlang types. To create a plt with sensible defaults run:

```bash
$ mix dialyzer --plt
```

Finally it can be run with:

```bash
$ mix dialyzer
```

Make sure to change the path to your system's path to the Elixir libraries. For
instance, if you installed Elixir with homebrew you will probably find it under
`/usr/local/Cellar/elixir/1.3.2`.

It should be reiterated that running Dialyzer and removing all warnings
is an optional step when completing an exercise. Dialyzer warnings can
be difficult to decipher. For instance, examine the warnings for this very silly
implementation of the `Bob` exercise.

```elixir
defmodule Bob do
  @spec hey(input :: String.t) :: String.t
  def hey(input) do
    1
  end

  def hey(input) do
  end
end
```

This produces the following warnings.

```bash
bob.exs:2: Invalid type specification for function 'Elixir.Bob':hey/1. The success typing is (_) -> 1
bob.exs:7: The variable _input@1 can never match since previous clauses completely covered the type any()
```

The first warning means that the function is not returning
the correct type. The last indicates that the second function
definition can never be reached because the first function
definition always matches.
