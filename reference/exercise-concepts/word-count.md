# Concepts for word-count

## Optimal solution

```elixir
defmodule WordCount do
  def count(sentence) do
    sentence
    |> String.downcase()
    |> to_word_list()
    |> to_word_count_map()
  end

  defp to_word_list(sentence) do
    ~r/[[:alnum:]-]+/u
    |> Regex.scan(sentence)
    |> List.flatten()
  end

  defp to_word_count_map(word_list) do
    update_count = fn word, map -> Map.update(map, word, 1, &(&1 + 1)) end
    Enum.reduce(word_list, %{}, update_count)
  end
end
```

## Concepts

- Strings
  - we are consuming a string in which to count words
- UTF-8
  - the exercise tests that we can handle UTF-8 characters
- Regex
  - regex should be used to deal with UTF-8 characters
- Enumeration
  - a list of words must be enumerated
- Maps
  - the return value is a map
- Immutability
  - the map must be updated without mutation
- Higher order functions
  - updating the map is best achieved with `Enum.reduce/3`, which takes a function as an argument
- Anonymous Functions
  - anonymous functions can be used to supply function parameters
