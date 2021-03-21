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

### Test All Assignments

To test all of the assignments against their example solution, you can run `bin/test_exercises.sh`:

```shell
$ ./bin/test_exercises.sh
Testing: accumulate -- Pass
Testing: acronym -- Pass
...
Testing: zipper -- Pass
--------------------------------------------------------------------------------
93/93 tests passed.
```

This will take some time.

### Test Specific Assignment

Go in the the specific exercise directory, run `mix test` to test an individual assignment:

```shell
cd exercises/$EXERCISE_NAME
mix test
```

### Dialyzer

To run dialyzer on all exercises, run `./bin/dialyzer_check.sh`. It might take a really long time the first time you run it. It will also be run for you by Github Actions as part of the PR check.

### Code and document formatting

To check formatting of all exercises and all documents, run `./bin/check_formatting.sh`. It will also be run for you by Github Actions as part of the PR check.

## Contributing Guide

If you want to help maintain the Elixir track, take a look at [HELLO.md](https://github.com/exercism/elixir/blob/master/HELLO.md). You will find there an introduction to all the possible ways you can help us.

If you want to contribute to this repository specifically, please see [CONTRIBUTING.md](https://github.com/exercism/elixir/blob/master/CONTRIBUTING.md).

