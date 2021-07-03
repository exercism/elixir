# Design

Conceptually, `resistor-color` needs to come before `resistor-color-duo` and `resistor-color-trio`.

To make that possible, we need to drop the function `colors` that list all of the colors from this exercise.
It doesn't appear in the duo or trio exercises.

The necessity to list all of the colors in order demands knowledge of `Enum` because there are those idiomatic approaches possible:
- a list of colors and find the colors value by its position in the list (`Enum.find_index`)
- a list of tuples with colors and values and map the list to be a list of colors
- a map, which becomes a list of tuples and needs to be sorted because map keys aren't sorted
