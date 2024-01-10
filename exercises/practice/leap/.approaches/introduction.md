# Introduction

Every fourth year is a leap year (with some exceptions), but let's consider this one condition first. 

To solve the Leap problem, we must determine if a year is evenly divisible by a number or if a reminder of an integer division is zero. 
Such operation in computing is called [modulo][modulo]. 

Unlike many languages, Elixir does not have [operators][operators] for either integer division or modulo. 
Instead, it provides [`rem/2`][rem] guard and the [`Integer.mod/2`][mod] function.

The two functions differ in how they work with negative numbers, but since, in this exercise,
all the numbers are non-negative, both could work, depending on the approach.

## General solution

To check if a year is divisible by `n`, we can do `rem(year, n) == 0`. We can define a function to make the intent clearer. 

```elixir
defp divides?(number, divisor), do: rem(number, divisor) == 0 
```

Any approach to the problem will perform this check three times to check if a year is equally divisible by 4, 100 and 400.
What will differ is what Elixir features we will use to combine the checks. 

## Approach: Boolean Operators

The full rules are as follows:
A year is a leap year if 
* it is divisible by 4 
* but not divisible by 100
* unless it is divisible by 400

We can use [boolean operators][boolean-operators] to combine the checks, for example, like so: 

```elixir
divides?(year, 400) or (not(divides?(year, 100))) and divides?(year, 4)
```
In the [boolean operators appraoch][operators-approach] we discuss the details of the solution.
It includes variations of the operators and their precendence.

## Approach: Multiple clause function

Instead of using boolean operators, we can define multiple `leap_year?/1` function clauses with different guards. 
We can use the order of the definitions to ensure correct check.

```elixir
def leap_year?(year) when rem(year, 400) == 0, do: true
def leap_year?(year) when rem(year, 100) == 0, do: false
def leap_year?(year) when rem(year, 4) == 0, do: true
def leap_year?(_), do: false
```

In the [functions with guards approach][guards-approach] we discuss why in this approach the `Integer.mod/2` function will not work. 

## Approach: Using cond

Similarly to the multiple clause function approach, we can also use a `cond` expression. 

```elixir
cond do
    divides?(year, 400) -> true
    divides?(year, 100) -> false
    divides?(year, 4) -> true
    true -> false
end
```

We discuss this briefly in the [cond approach][cond-approach]

## Approach: Using case

Using `case` is yet another way to check for a leap year.
This time, all the reminders are calculated and put into a tuple, and pattern matching is used to decide the outcome. 

```elixir
case { rem(year, 400), rem(year, 100), rem(year, 4) } do
    { 0, _, _ } -> true
    { _, 0, _ } -> false
    { _, _, 0 } -> true
    { _, _, _ } -> false
end
```
In the [case approach][case-approach] we discuss the pattern matchin in a case expression. 


[modulo]: https://en.wikipedia.org/wiki/Modulo
[operators]: https://hexdocs.pm/elixir/operators.html
[rem]: https://hexdocs.pm/elixir/Kernel.html#rem/2
[mod]: https://hexdocs.pm/elixir/Integer.html#mod/2
[boolean-operators]: https://hexdocs.pm/elixir/operators.html#general-operators
[operators-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/operators
[guards-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/guards
[cond-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/cond
[case-approach]: https://exercism.org/tracks/elixir/exercises/leap/approaches/case


