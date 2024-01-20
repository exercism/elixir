# Instructions

You are working with a web development team to maintain a website for a local basketball team. The web development team is less familiar with Elixir and is asking for a function to be able to extract data from a series of nested maps to facilitate rapid development.

## 1. Extract data from a nested map structure

Implement the `extract_from_path/2` function to take two arguments:

- `data`: a nested map structure with data about the basketball team.
- `path`: a string consisting of period-delimited keys to obtain the value associated with the last key.

If the value or the key does not exist at any point in the path, `nil` should be returned

```elixir
data = %{
  "team_mascot" => %{
    "animal" => "bear",
    "actor" => %{
      "first_name" => "Noel"
    }
  }
}

BasketballWebsite.extract_from_path(data, "team_mascot.animal")
# => "bear"
BasketballWebsite.extract_from_path(data, "team_mascot.colors")
# => nil
```

Use the _Access Behaviour_ when implementing this function.

Do not use any `Map` or `Kernel` module functions for working with the nested map data structure.

## 2. Refactor using included functions

Your coworker reviewing your code tells you about a `Kernel` module function which does something very similar to your implementation.

Implement `get_in_path/2` to use this `Kernel` module function.

The arguments expected are the same as part 1.

```elixir
BasketballWebsite.get_in_path(data, "team_mascot.actor.first_name")
# => "Noel"
```
