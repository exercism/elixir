# Instructions append

## Elixir-specific changes

The above description of this exercise is shared between all Exercism tracks.

To be consistent with Elixir's standard library, the functions used by `foldl` and `foldr` should take the item as the first argument, and the accumulator as the second.

Additionally, in order not to conflict with the automatically imported function `Kernel.length/1`, the function counting the length will be named `count` instead.

## Slow tests

One or several of the tests of this exercise have been tagged as `:slow`, because they might take a long time to finish. For this reason, they will not be run on the platform by the automated test runner. If you are solving this exercise directly on the platform in the web editor, you might want to consider downloading this exercise to your machine instead. This will allow you to run all the tests and check the efficiency of your solution.
