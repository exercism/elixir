# xElixir
![build status](https://travis-ci.org/exercism/xelixir.svg?branch=master)

Exercism Exercises in Elixir	

## Setup

The exercises currently target Elixir 1.2. Detailed installation instructions can be found at [http://elixir-lang.org/install.html](http://elixir-lang.org/install.html).

##Contributing

Thank you so much for contributing! :tada:

Please start by reading the general Exercism [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data).

We welcome pull requests that provide fixes and improvements to existing exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

Please keep the following in mind:

- Pull requests should be focused on a single exercise, issue, or change.

- We welcome changes to code style, and wording. Please open a separate PR for these changes if possible.

- Please open an issue before creating a PR that makes significant (breaking) changes to an existing exercise or makes changes across many exercises. It is best to discuss these changes before doing the work.

- Each exercise must stand on its own. Do not reference files outside the exercise directory. They will not be included when the user fetches the exercise.

- Please do not add a README or README.md file to the exercise directory. The READMEs are constructed using shared metadata, which lives in the
[exercism/x-common](https://github.com/exercism/x-common) repository.

- Each problem should have a test suite, an example solution, and a template file for the real implementation.
The example solution should be named `example.exs`.

- Each test file should have code like the following at the top of the file. This allows the tests to be run on CI and configures tests to be skipped with the `:pending` flag.

```elixir
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("bob.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true
```

- All but the intial test for each exercise should be tagged `:pending`.


```elixir
@tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

All the tests for xElixir exercises can be run from the top level of the repo with `EXERCISM_TEST_EXAMPLES=true mix test --include pending **/*_test.exs`. Please run this command before submitting your PR. Watch out for and correct any compiler warnings you may have introduced.

## License

The MIT License (MIT)

Copyright (c) 2016 Katrina Owen, _@kytrinyx.com
