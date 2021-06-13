# Exercism Elixir Track

![build status](https://travis-ci.org/exercism/elixir.svg?branch=master)

Exercism Exercises in Elixir

## Setup

The exercises currently target Elixir >= 1.7 and Erlang/OTP >= 20. Detailed
installation instructions can be found at
[http://elixir-lang.org/install.html](http://elixir-lang.org/install.html).

## Testing

---

> It is recommended to test BEFORE submitting a PR. It will test your submission, ensure
> that the repository builds as a whole, and help guard against unintentional, unrelated changes.

---

### Test Exercises

To test all of the exercises against their example solution, you can run `bin/test_exercises.sh`:

```shell
$ ./bin/test_exercises.sh
Testing: accumulate Pass
Testing: acronym Pass
...
Testing: zipper Pass
--------------------------------------------------------------------------------
93/93 tests passed.
```

This will take some time.

To only test some exercises, run:

```shell
$ ./bin/test_exercises.sh word-count zebra-puzzle
Testing: word-count Pass
Testing: zebra-puzzle Pass
--------------------------------------------------------------------------------
2/2 tests passed.
```

### Dialyzer

To run dialyzer on all exercises, run `./bin/dialyzer_check.sh`. It might take a really long time the first time you run it. It will also be run for you by Github Actions as part of the PR check.

### Code and document formatting

To check formatting of all exercises and all documents, run `./bin/check_formatting.sh`. It will also be run for you by Github Actions as part of the PR check.

### Track linting

[`configlet`](https://github.com/exercism/configlet) is an Exercism-wide tool for working with tracks. You can download it by running:

```shell
$ ./bin/fetch_configlet.sh
```

R run its `lint` command to verify if all exercises have all the necessary files and if config files are correct:

```shell
$ ./bin/configlet lint

The `exercises.practice.slug` value is `transpose 🙂`, but it must be a lowercase and kebab-case string:
/Users/angelika/Documents/exercism/elixir/config.json

Configlet detected at least one problem.
For more information on resolving the problems, please see the documentation:
https://github.com/exercism/docs/blob/main/building/configlet/lint.md
```

## Contributing Guide

If you want to help maintain the Elixir track, take a look at [HELLO.md](https://github.com/exercism/elixir/blob/master/HELLO.md). You will find there an introduction to all the possible ways you can help us.

If you want to contribute to this repository specifically, please see [CONTRIBUTING.md](https://github.com/exercism/elixir/blob/master/CONTRIBUTING.md).
