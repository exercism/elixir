# Hello!

So you want to help out with the Elixir track on Exercism? That's awesome! 💜

There are plenty of tasks that you can help with. Below you will find a list of tasks with which the Elixir track needs your help, sorted by importance in descending order (most important first).

## Need guidance?

If you have any questions, if you're unsure where to start or you're stuck, do not hesitate to ask for help in our **#maintaining-elixir** Slack channel.

## Tasks

### 1. Create, improve, and review concepts and concept exercises

Check open issues and PRs in this repository [tagged with the concept-exercise label](https://github.com/exercism/elixir/issues?q=is%3Aopen+sort%3Aupdated-desc+label%3Aconcept-exercise) to see which concepts need a new exercise or an improvement.

You can read through existing concepts and concept exercises, and suggest improvements. Even a fixed typo or a grammar error will be highly appreciated!

To prepare for this task, make sure to read the documentation about concept exercises. They are different from the exercises you already know from Exercism.

Creating a new exercise doesn't need to be done all at once. We would suggest starting with a story and an example solution. Once you have that, you can open a draft PR to get early feedback.

#### Who is this task well-suited for?

Everyone that has interest in the Elixir programming language.

#### Time investment

One-time ~1h investment to learn how a concept exercise is structured, and then from 15 min for a review/improvement, to ~4h for creating a new exercise.

#### Useful links for this task

- [Open issues for concepts and concept exercises](https://github.com/exercism/elixir/issues?q=is%3Aopen+sort%3Aupdated-desc+label%3Ax%3Amodule%2Fconcept-exercise%2Cx%3Amodule%2Fconcept)
- [Concept exercises docs](https://github.com/exercism/docs/blob/main/building/tracks/concept-exercises.md)

### 2. Create or improve an analyzer for a concept exercise

An analyzer is a tool that analyzes the AST of an exercise solution looking for specific features. Based on the results, it can leave helpful comments for the student.

Some concept exercises must have an analyzer. Their goal is to teach how to use specific features of the language, so we need to look out for solutions that pass the tests, but don't use the taught features.

See [the list of open analyzer issues](https://github.com/exercism/elixir-analyzer/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc).

This task isn't as difficult as it might sound! We already have the tool for this job. It's all about using it to describe the desired features of a good solution. See the example PR in links.

#### Who is this task well-suited for?

Everyone that has interest in the Elixir programming language. Concept exercises are supposed to have a single desired solution that every student should strive for, and thus writing an analyzer for them is much easier than for practice exercises.

#### Time investment

One-time ~30 min investment to get familiar with how existing analyzers are written and the concept exercise in
question, and then ~30-60 min for writing the analyzer.

#### Useful links for this task

- [What is an analyzer?](https://github.com/exercism/docs/tree/main/building/tooling/analyzers)
- [How to write an analyzer?](https://github.com/exercism/elixir-analyzer/blob/master/docs/writing-an-analyzer.md)
- [Analyzer recipes](https://github.com/exercism/elixir-analyzer/blob/main/docs/recipes.md)
- [Open analyzer issues](https://github.com/exercism/elixir-analyzer/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
- [Example PR adding an analyzer for the pacman-rules exercise](https://github.com/exercism/elixir-analyzer/pull/30/files)
- [Currently implemented analyzers](https://github.com/exercism/elixir-analyzer/tree/main/lib/elixir_analyzer/test_suite)
- [Elixir's automated comments](https://github.com/exercism/website-copy/tree/main/analyzer-comments/elixir)

### 3. Check open issues and PRs in other repos

Browse all the open issues in all the Elixir track repositories and choose something that sounds interesting! If an issue is tagged with "help wanted", that means it's well suited for all contributors interested in helping out. Issues without this label are meant for the regular track maintainers.

#### Who is this task well-suited for?

People that already have some experience contributing to Exercism. Maintaining a language track requires knowledge of how the Exercism platform works, e.g. every track should adhere to the cross-track problem specifications that define practice exercises. Maintaining the tools (analyzer, tests runner, representer) requires some knowledge of how the Exercism platform works, how the Elixir track is structured, and how the specific tools work.

#### Time investment

Anything from 15 minutes to many hours, depending on the specific issue.

#### Useful links for this task

- [What is track tooling?](https://github.com/exercism/docs/tree/main/building/tooling)
- [Open issues and PRs in the Elixir analyzer](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-analyzer)
- [Open issues and PRs in the Elixir test runner](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-test-runner)
- [Open issues and PRs in the Elixir representer](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir-representer)
- [Open issues and PRs in the Elixir track](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir)
- [Open issues and PRs in all the four repos listed above](https://github.com/pulls?q=is%3Aopen+repo%3Aexercism%2Felixir+repo%3Aexercism%2Felixir-test-runner+repo%3Aexercism%2Felixir-representer+repo%3Aexercism%2Felixir-analyzer)
- [Problem specifications repo](https://github.com/exercism/problem-specifications)

### 4. Create an analyzer for an existing practice exercise

Almost all existing practice exercises could use an analyzer. It would decrease the work load of the mentors.

There are no open issues for this type of task, but it can still be worked on.

#### Who is this task well-suited for?

People that already have some experience mentoring the specific Elixir exercise. Writing an analyzer well requires anticipating a lot of different approaches to the same exercise.

#### Time investment

One-time ~30 min investment to get familiar with how existing analyzers are written, and then at least a few hours to think through all possible approaches to the exercise .

#### Useful links for this task

- [What is an analyzer?](https://github.com/exercism/docs/tree/main/building/tooling/analyzers)
- [How to write an analyzer?](https://github.com/exercism/elixir-analyzer/blob/master/docs/writing-an-analyzer.md)
- [Analyzer recipes](https://github.com/exercism/elixir-analyzer/blob/main/docs/recipes.md)
- [Two-fer analyzer](https://github.com/exercism/elixir-analyzer/blob/deb8f57342a797361af4be604f31dc09f550f79e/lib/elixir_analyzer/test_suite/two_fer.ex)
- [Currently implemented analyzers](https://github.com/exercism/elixir-analyzer/tree/main/lib/elixir_analyzer/test_suite)
- [Elixir's automated comments](https://github.com/exercism/website-copy/tree/main/analyzer-comments/elixir)
- [General Exercism docs](https://github.com/exercism/docs)
