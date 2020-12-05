# Hello!

So you want to help out with the Elixir track on Exercism? That's awesome! 💜

There are plenty of tasks that you can help with. Below you will find a list of tasks with which the Elixir track needs your help, sorted by importance in descending order (most important first).

## Need guidance?

If you have any questions, if you're unsure where to start or you're stuck, do not hesitate to ask for help in our **#maintaining-elixir** Slack channel.

## Tasks

### 1. Create, improve, and review concepts and concept exercises for v3

Check open issues in PRs in the [exercism/v3](https://github.com/exercism/v3/) repository to see which concepts need a new exercise or an improvement.

You can read through existing concepts and concept exercises, and suggest improvements. Even a fixed typo or a grammar error will be highly appreciated!

To prepare for this task, make sure to read the documentation about concept exercises. They are different from the exercises you already know from Exercism.

Creating a new exercise doesn't need to be done all at once. We would suggest starting with a story and an example solution. Once you have that, you can open a draft PR to get early feedback.

#### Who is this task well-suited for?

Everyone that has interest in the Elixir programming language.

#### Time investment

One-time ~1h investment to learn how a concept exercise is structured, and then from 15 min for a review/improvement, to ~4h for creating a new exercise.

#### Useful links for this task

- [Open issues and PRs for Elixir in v3](https://github.com/exercism/v3/issues?q=is%3Aopen+sort%3Aupdated-desc+label%3Atrack%2Felixir)
- [V3 Elixir concept exercises](https://github.com/exercism/v3/tree/master/languages/elixir/exercises/concept)
- [V3 Elixir concepts](https://github.com/exercism/v3/tree/master/languages/elixir/concepts)
- [V3 contributing dashboard](https://v3.exercism.io/elixir/contributing)
- [The features of v3](https://github.com/exercism/v3/blob/master/docs/features-of-v3.md).
- [Rationale for v3](https://github.com/exercism/v3/blob/master/docs/rationale-for-v3.md).
- [What are concept exercise and how they are structured?](https://github.com/exercism/v3/blob/master/docs/concept-exercises.md)

### 2. Create an analyzer for a v3 concept exercise

An analyzer is a tool that analyzes the AST of an exercise solution looking for specific features. Based on the results, it can leave helpful comments for the student.

Some v3 concept exercises must have an analyzer. They won't be mentored, and their goal is to teach how to use specific features of the language, so we need to look out for solutions that pass the tests, but don't use the taught features.

You will recognize the exercises that need an analyzer by their `design.md` file containing an "analyzer" section that outlines what features of a desired solution need to be checked for
([example](https://github.com/exercism/v3/blob/6576904cbe3ddae26b23a418da8e012162980c4a/languages/elixir/exercises/concept/boutique-inventory/.meta/design.md#L29-L34))
.

You can choose any exercise that doesn't already have an analyzer and try to implement one.

This task isn't as difficult as it might sound! We already have the tool for this job. It's all about using it to describe the desired features of a good solution. See the example PR in links.

#### Who is this task well-suited for?

Everyone that has interest in the Elixir programming language. Concept exercises are supposed to have a single desired solution that every student should strive for, and thus writing an analyzer for them is much easier than for practice exercises.

#### Time investment

One-time ~30 min investment to get familiar with how existing analyzers are written and the concept exercise in
question, and then ~1-2h for writing the analyzer.

#### Useful links for this task

- [What is an analyzer?](https://github.com/exercism/v3-docs/tree/master/anatomy/track-tooling/analyzers)
- [V3 Elixir concept exercises](https://github.com/exercism/v3/tree/master/languages/elixir/exercises/concept)
- [Currently implemented analyzers](https://github.com/exercism/elixir-analyzer/tree/master/lib/elixir_analyzer/exercise_test)
- [How to write an analyzer?](https://github.com/exercism/elixir-analyzer/blob/master/docs/writing-an-analyzer.md)
- [Example PR adding an analyzer for the pacman-rules exercise](https://github.com/exercism/elixir-analyzer/pull/30/files)
- [Elixir's automated comments](https://github.com/exercism/website-copy/tree/master/automated-comments/elixir)

### 3. Check open issues and PRs in other repos

To launch v3, we need a well-working analyzer, test runner, and representer. All of those projects are already created and functional, but they might still need some improvements.

V3 is our current focus, but really don't want to get involved with it at the moment, you can also check if the current Elixir track has open issues or PRs that could benefit from more attention.

#### Who is this task well-suited for?

People that already have some experience contributing to Exercism. Maintaining a language track requires knowledge of how the Exercism platform works, e.g. every track should adhere to the cross-track problem specifications that define practice exercises. Maintaining the tools (analyzer, tests runner, representer) requires some knowledge of how the Exercism platform works, how the Elixir track is structured, and how the specific tools work.

#### Time investment

Anything from 15 minutes to many hours, depending on the specific issue.

#### Useful links for this task

- [What is track tooling?](https://github.com/exercism/v3-docs/tree/master/anatomy/track-tooling#track-tooling)
- [Open issues and PRs in the Elixir analyzer](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-analyzer)
- [Open issues and PRs in the Elixir test runner](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-test-runner)
- [Open issues and PRs in the Elixir representer](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-representer)
- [Open issues and PRs in the Elixir track](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir)
- [Open issues and PRs in all the four repos listed above](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir+repo%3Aexercism%2Felixir-test-runner+repo%3Aexercism%2Felixir-representer+repo%3Aexercism%2Felixir-analyzer)
- [Problem specifications repo](https://github.com/exercism/problem-specifications)

### 4. Create an analyzer for an existing practice exercise

Almost all existing practice exercises could use an analyzer. It would decrease the work load of the mentors.

#### Who is this task well-suited for?

People that already have some experience mentoring the specific Elixir exercise. Writing an analyzer well requires anticipating a lot of different approaches to the same exercise.

#### Time investment

One-time ~30 min investment to get familiar with how existing analyzers are written, and then at least a few hours to think through all possible approaches to the exercise .

#### Useful links for this task

- [What is an analyzer?](https://github.com/exercism/v3-docs/tree/master/anatomy/track-tooling/analyzers)
- [Currently implemented analyzers](https://github.com/exercism/elixir-analyzer/tree/master/lib/elixir_analyzer/exercise_test)
- [How to write an analyzer?](https://github.com/exercism/elixir-analyzer/blob/master/docs/writing-an-analyzer.md)
- [Two-fer analyzer](https://github.com/exercism/elixir-analyzer/blob/3827403d0f1cd5cd4c4b8d5a9e7736f19cce5ea4/lib/elixir_analyzer/exercise_test/two_fer.ex)
- [Elixir's automated comments](https://github.com/exercism/website-copy/tree/master/automated-comments/elixir)
- [General Exercism docs](https://github.com/exercism/docs)

### 5. Port a new practice exercise from problem specifications

There are still a few practice exercises on the platform that the Elixir track hasn't implemented yet. You can find one in the problems specification repo and port it to Elixir.

#### Who is this task well-suited for?

People that already have some experience maintaining the Elixir track.

#### Time investment

A few hours.

#### Useful links for this task

- [Existing Elixir practice exercises](https://github.com/exercism/elixir/tree/master/exercises)
- [Problem specifications repo](https://github.com/exercism/problem-specifications)
- [Porting an Exercise to Another Language Track](https://github.com/exercism/docs/blob/master/you-can-help/implement-an-exercise-from-specification.md)
- [Elixir's CONTRIBUTING.md](https://github.com/exercism/elixir/blob/master/CONTRIBUTING.md)
- [General Exercism docs](https://github.com/exercism/docs)
