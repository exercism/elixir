[`case`][case] is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` expression are evaluated from top to bottom, until a match is found.

In many cases, using `case` is interchangeable with defining multiple function clauses. Pattern matching and guards can be used in `case` clauses.

```elixir
# one function clause, multiple case clauses
def age_group(age) do
  case age do
    0 -> 'infant'
    age when age < 4 -> 'baby'
    age when age < 13 -> 'child'
    age when age < 18 -> 'teenager'
    _ -> 'adult'
  end
end

# multiple function clauses, no case
def age_group(0), do: 'infant'
def age_group(age) when age < 4, do: 'baby'
def age_group(age) when age < 13, do: 'child'
def age_group(age) when age < 18, do: 'teenager'
def age_group(_), do: 'adult'
```

There are no strict rules for choosing one over the other. It's a matter of personal preference that usually depends on context.

[case]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2
