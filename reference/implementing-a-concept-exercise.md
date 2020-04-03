# How to implement an Elixir Concept Exercise

This document describes how to implement a Concept Exercise for the Elixir track. As this document is generic, the following placeholders are used:

- `$slug`: the name of the exercise in snake_case (e.g. `anonymous-methods`).
- `$elixir_slug`: `$slug` converted to snake-case from kebab-case,
- `$concepts`: the Concepts the exercise is about (e.g. `loops`),
- `$concept-1`: a single Concept slug,
- `$prerequisite-n`: a single Concept slug,
- `$uuid`: a _new_ v4 UUID (random! and unique to all other concept and practice exercises)
- `$first-and-last-name`: your first and last name (e.g. `Tim Austin`)
- `$git-email`: the email address you use for git (e.g. `tim@neenjaw.com`)

Before implementing the exercise, please make sure you have a good understanding of what the exercise should be teaching (and what not). This information can be found in the exercise's GitHub issue. Having done this, please read the [Elixir Concept exercises introduction][concept-exercises]. If you have come up with something completely new, create a new issue _first_ so we can discuss the Concept Exercise.

To implement a Concept Exercise, the following files must be created:

```text
languages
└── elixir
    └── exercises
        └── concept
            └── $slug
                ├── .docs
                │   ├── instructions.md
                │   ├── introduction.md
                │   ├── hints.md
                │   └── after.md
                ├── .meta
                │   ├── config.json
                │   └── design.md
                ├── lib
                │   ├── example.ex
                │   └── $slug.ex
                ├── mix.exs
                ├── mix.lock
                └── test
                    ├── $slug_test.exs
                    └── test_helper.exs
```

## Step 1: add .docs/introduction.md

This file contains an introduction to the concept. It should make the exercise's learning goals explicit and provide a short introduction with enough detail for the student to complete the exercise. The aim is to give the student just enough context to figure out the solution themselves, as research has shown that self-discovery is the most effective learning experience. Using the proper technical terms in the descriptions will be helpful if the student wants to search for more information. If the exercise introduces new syntax, an example of the syntax should always be included; students should not need to search the web for examples of syntax.

As an example, the introduction to a "strings" exercise might describe a string as just a "Sequence of Unicode characters" or a "series of bytes". Unless the student needs to understand more nuanced details in order to solve the exercise, this type of brief explanation (along with an example of its syntax) should be sufficient information for the student to solve the exercise.

## Step 2: add .docs/instructions.md

This file contains instructions for the exercise. It should explicitly explain what the student needs to do (define a method with the signature `X(...)` that takes an A and returns a Z), and provide at least one example usage of that function. If there are multiple tasks within the exercise, it should provide an example of each.

## Step 3: add .docs/hints.md

If the student gets stuck, we will allow them to click a button requesting a hint, which shows this file. This will not be a "recommended" path and we will (softly) discourage them using it unless they can't progress without it. As such, it's worth considering that the student reading it will be a little confused/overwhelmed and maybe frustrated.

The file should contain both general and task-specific "hints". These hints should be enough to unblock almost any student. They might link to the docs of the functions that need to be used.

The hints should not spell out the solution, but instead point to a resource describing the solution (e.g. linking to documentation for the function to use).

## Step 4: add .docs/after.md

Once the student completes the exercise they will be shown this file, which should provide them with a summary of what the exercise aimed to teach. If the exercise introduced new syntax, syntax samples should be included. This document can also link to any additional resources that might be interesting to the student in the context of the exercise.

## Step 5: add .meta/config.json

This file contains metadata for the exercise. The metadata includes paths to the test file and the solution files, as well as a list of all the tests and the method they are calling.

## Step 6: update languages/Elixir/config.json

An entry should be added to the track's `config.json` file for the new Concept Exercise:

```json
{
  ...
  "exercises": {
    "concept": [
      ...
      {
        "slug": "$slug",
        "uuid": "$uuid",
        "concepts": ["$concept-1"],
        "prerequisites": ["$prerequisite-1", "$prerequisite-2"]
      }
    ]
  }
}
```

## Step 7: adding track-specific files

The configuration files may be copied from another exercise. But it would be recommended to use `mix new $elixir_slug` (where `$elixir_slug` exchanges underscores `_` in the place of `$slug`'s dashes `-`) for file generation, the move the generated structure to the `$slug` directory to match the structure in this guide.

Now create the following three files:

- `lib/$slug.ex`. the stub implementation file, which is the starting point for students to work on the exercise.
- `test/$slug_test.ex`: the test suite.
- `lib/example.ex`: an example implementation that passes all the tests.

## Step 8: add analyzer (optional)

Some exercises could benefit from having an exercise-specific [analyzer][analyzer]. If so, specify what analysis rules should be applied to this exercise and why.

## Step 9: custom representation (optional)

Some exercises could benefit from having an custom representation as generated by the [Elixir representer][representer]. If so, specify what changes to the representation should be applied and why.

## Step 10: add `.meta/design.md`

This file contains information on the exercise's design, which includes things like its goal, its teaching goals, what not to teach, and more. This information can be extracted from the exercise's corresponding GitHub issue.

## Step 11: add `.meta/config.json`

This file contains meta information on the exercise, which currently only includes the exercise's contributors.

## Inspiration

When implementing an exercise, it can be very useful to look at the exercises the track has already implemented. You can also check the exercise's [general concepts documents][reference] to see if other languages that have already an exercise for that Concept.

## Help

If you have any questions regarding implementing the exercise, please post them as comments in the exercise's GitHub issue.

[analyzer]: https://github.com/exercism/elixir-analyzer
[representer]: https://github.com/exercism/elixir-representer
[concept-exercises]: ../exercises/concept/README.md
[how-to-implement-a-concept-exercise]: ../../../docs/maintainers/generic-how-to-implement-a-concept-exercise.md
[reference]: ../../../reference/README.md
