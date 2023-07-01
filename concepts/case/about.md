# About

[`case`][case] is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` expression are evaluated from top to bottom, until a match is found.

In many cases, using `case` is interchangeable with defining [multiple function clauses][exercism-multiple-clause-functions]. [Pattern matching][exercism-pattern-matching] and [guards][exercism-guards] can be used in `case` clauses.

```elixir
# one function clause, multiple case clauses
def age_group(age) do
  case age do
    0 -> ~c"infant"
    age when age < 4 -> ~c"baby"
    age when age < 13 -> ~c"child"
    age when age < 18 -> ~c"teenager"
    _ -> ~c"adult"
  end
end

# multiple function clauses, no case
def age_group(0), do: ~c"infant"
def age_group(age) when age < 4, do: ~c"baby"
def age_group(age) when age < 13, do: ~c"child"
def age_group(age) when age < 18, do: ~c"teenager"
def age_group(_), do: ~c"adult"
```

There are no strict rules for choosing one over the other. It's a matter of personal preference that usually depends on context.

[case]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2
[exercism-multiple-clause-functions]: https://exercism.org/tracks/elixir/concepts/multiple-clause-functions
[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching
[exercism-guards]: https://exercism.org/tracks/elixir/concepts/guards
