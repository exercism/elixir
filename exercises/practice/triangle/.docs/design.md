# Design

The Elixir implementation of this exercise defines a single function that returns the type of the triangle, as opposed to having a boolean function for each type.
This makes error handling nicer because we're not limited by a boolean return value.
That means that some of the test cases from canonical data make no sense for Elixir, e.g both checking that `[2, 3, 2]` is not an equilateral triangle and checking that `[4, 3, 4]` is an isosceles triangle.
