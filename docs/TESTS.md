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

### Typespecs and Dialyzer (DIscrepancy AnalYZer for ERlang programs)

Elixir exercises include a skeleton implementation file. This
file outlines the module and functions that you are expected
to implement. In most exercises, you will find typespecs
above the function declaration. These start with the `@spec` tag and
typically follow the `@spec function_name(type1, type2) :: return_type`
format. These are used in Elixir and Erlang as documentation and
in conjunction with a tool called Dialyzer to find type inconsistencies
and possible bugs. For more information see the
[Elixir typespecs guide](http://elixir-lang.org/getting-started/typespecs-and-behaviours.html)
or the [typespecs documentation](http://elixir-lang.org/docs/stable/elixir/typespecs.html). For
documentation about Dialyzer see [Erlang -- dialyzer](http://erlang.org/doc/man/dialyzer.html).

Optionally, you may want to check
the types of your implementation with Dialyzer. There are a couple
of steps you will need to take. Because all of the Elixir exercises
are implemented as `.exs` script files they will not create a
`.beam` file when they are dynamically compiled when running
normal tests. In order to create the `.beam` file that Dialyzer
needs to analyze run:

```bash
$ elixirc word_count.exs
```

This will create a file called `Elixir.Words.beam`. Now you can run
Dialyzer on your implementation with:

```bash
$ dialyzer Elixir.Words.beam

Checking whether the PLT ~/.dialyzer_plt is up-to-date... yes
  Proceeding with analysis...
  done in 0m0.27s
done (passed successfully)
```

If this is the first time you have run Dialyzer you
will most likely not have a `plt` file. The persistent lookup table,
or PLT is used by Dialyzer to cache information about built in Elixir
and Erlang types. To create a plt with sensible defaults run:

```bash
$ dialyzer --build_plt --apps erts kernel stdlib crypto public_key /path/to/elixir
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
