# Contributing

Thank you so much for contributing! :tada:

We welcome pull requests that provide fixes and improvements to existing
exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll
discuss the change.

## General rules

Please keep the following in mind:

- For Exercism-wide explanations of how a track is structured, [look in the `exercism/docs` repository](https://github.com/exercism/docs/tree/main/building/tracks).

- Pull requests should be focused on a single exercise, issue, or change.

- We welcome changes to code style, and wording. Please open a separate PR for
  these changes if possible.

- Content (exercises, documentation etc.) should be written in American English.

- Please open an issue before creating a PR that makes significant (breaking)
  changes to an existing exercise or makes changes across many exercises. It is
  best to discuss these changes before doing the work.

- Follow the coding standards found in
  [The Elixir Style Guide](https://github.com/lexmag/elixir-style-guide).

- Watch out for trailing spaces, extra blank lines, and spaces in blank lines.

- The CI is going to run a lot of check on your PR. Pay attention to the failures, try to understand and fix them.


## Exercises

- Each exercise must stand on its own. Do not reference files outside the
  exercise directory. They will not be included when the user fetches the
  exercise.

- Each problem should have a test suite, an example solution, and a template
  file for the real implementation. Read about [the anatomy of practice exercises](https://github.com/exercism/docs/blob/main/building/tracks/practice-exercises.md) or [the anatomy of concept exercises](https://github.com/exercism/docs/blob/main/building/tracks/concept-exercises.md), depending on to which type of exercise you want to contribute.

- For practice exercises, `instructions.md` come from the [problem specifications](https://github.com/exercism/problem-specifications) repository. They cannot be changed without updating them in that repository first. If Elixir-specific changes are necessary, they can be appended to the instructions by creating a `instructions.append.md` file.

- For practice exercises, use typespecs in the example and template files as described [here](https://hexdocs.pm/elixir/typespecs.html).

- Each practice exercise test file should have a `test_helper.exs` with code like the following at the top of the file.
  This allows the tests to be run on CI and configures tests to be skipped with the `:pending` flag.

    ```elixir
    ExUnit.start()
    ExUnit.configure(exclude: :pending, trace: true)
    ```

- Each concept exercise test file should have a `test_helper.exs` with code like the following at the top of the file.
  This allows the tests to always run in the order in which they're defined in the test file, to encourage solving the exercises task by task.

    ```elixir
    ExUnit.start()
    ExUnit.configure(exclude: :pending, trace: true, seed: 0)
    ```

- All but the initial test for each practice exercise should be tagged `:pending`.

    ```elixir
    @tag :pending
    test "shouting" do
      assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
    end
    ```

- No tests should be skipped for concept exercises.

- For concept exercises, each test block should be understandable without having to reference anything outside the test block, e.g. no module attributes, no setup functions. This is because the platform doesn't show the test files for concept exercises in the web editor. Only the single test's block is shown by the Test Runner if the test failed.

- `.meta/tests.toml` files are generated and updated by `configlet`.

    ```shell
    # check which exercises need updating
    $ ./bin/configlet sync

    # add all missing tests to tests.toml for a given exercise
    $ ./bin/configlet sync --update --exercise zebra-puzzle

    ```

- For practice exercises, solution stubs should usually contain all tested public functions with empty bodies, with typespecs and docs.

- For concept exercises, solution stubs should usually contain all tested public functions with empty bodies, without typespecs or docs, with comments saying what to do. The comments should all follow the same pattern (e.g. "Please implement the function_name/arity function") so that they can be found by [the analyzer check for forgetting to remove the boilerplate comments](https://github.com/exercism/elixir-analyzer/blob/main/lib/elixir_analyzer/exercise_test/common_checks/comments.ex).

## Language versions

- We try to keep all exercises compatible with older Elixir and Erlang versions. We aim to support the 6 latest minor Elixir versions.

- All test suites and example solutions must work in all Elixir and Erlang versions that we currently support. Please consult the GitHub workflows configuration (e.g. `.github/workflows/pr.ci.yml`) to check which versions those are.

- As soon as a new minor Elixir version is released, we want to start supporting it, and we drop support of the oldest currently supported version.

- The test runner always runs on the newest minor Elixir version.

- The exercises' `mix.exs` files should have the Elixir version commented out.


## External dependencies

Exercises should not use any external dependencies. Each exercise should be solvable with the standard library only.

This allows us more freedom with language version management and keeps the learning process easier for students.
