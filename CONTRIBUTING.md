# Contributing

Thank you so much for contributing! :tada:

We welcome pull requests that provide fixes and improvements to existing
exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll
discuss the change.

Please keep the following in mind:

- Please start by reading the general Exercism [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data).

- Pull requests should be focused on a single exercise, issue, or change.

- We welcome changes to code style, and wording. Please open a separate PR for
  these changes if possible.

- Please open an issue before creating a PR that makes significant (breaking)
  changes to an existing exercise or makes changes across many exercises. It is
  best to discuss these changes before doing the work.

- Follow the coding standards found in
  [The Elixir Style Guide](https://github.com/lexmag/elixir-style-guide).

- Watch out for trailing spaces, extra blank lines, and spaces in blank lines.

- Each exercise must stand on its own. Do not reference files outside the
  exercise directory. They will not be included when the user fetches the
  exercise.

- Each problem should have a test suite, an example solution, and a template
  file for the real implementation. Read about [the anatomy of practice exercises][https://github.com/exercism/docs/blob/main/anatomy/tracks/practice-exercises.md] or [the anatomy of concept exercises][https://github.com/exercism/docs/blob/main/anatomy/tracks/concept-exercises.md], depending on to which type of exercise you want to contribute.

- For practice exercises, use typespecs in the example and template files as described [here](http://elixir-lang.org/getting-started/typespecs-and-behaviours.html).

- Each test file should have a `test_helper.exs` with code like the following
  at the top of the file. This allows the tests to be run on CI and configures
  tests to be skipped with the `:pending` flag.

    ```elixir
    ExUnit.start
    ExUnit.configure exclude: :pending, trace: true
    ```

- All but the initial test for each exercise should be tagged `:pending`.

    ```elixir
    @tag :pending
    test "shouting" do
      assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
    end
    ```

All the tests for Exercism Elixir Track exercises can be run from the top level of the repo
with `$ ./bin/test_exercises.sh`. Please run this command before submitting your PR. Watch out
for and correct any compiler warnings you may have introduced.
