# Hints

## General

- Read the documentation for [MapSet][mapset]
- The documentation for [Enum][enum] might be useful too

## 1. Start a collection

- The most appropriate `MapSet` function is [`MapSet.new/1`][new]

## 2. Grow the collection

- Use the [`MapSet.put/2` function][put]
- Use the [`MapSet.member?/2` function][member]

## 3. Start trading

- Use the [`MapSet.member?/2` function][member]
- Use the [`MapSet.put/2` function][put]
- Use the [`MapSet.delete/2` function][delete]

## 4. There can be only one of each

- A `MapSet` has the property of only holding unique values
- Use the [`MapSet.new/1` function][new]
- Use the [`MapSet.to_list/1` function][to_list]
- `MapSet.to_list/1` does not guarantee to return a sorted list

## 5. Cards they don't have

- Use the [`MapSet.difference/2` function][difference]
- Use the [`MapSet.size/1` function][size]

## 6. Cards they all have

- Use the [`Enum.reduce/3` function][reduce]
- Use pattern matching on the list to differentiate empty and non-empty lists
- Use the [`MapSet.intersection/2` function][intersection]
- Use the [`MapSet.to_list/1` function][to_list]
- `MapSet.to_list/1` does not guarantee to return a sorted list

## 7. All of the cards

- Use the [`Enum.reduce/3` function][reduce]
- Use [`MapSet.new/0`][new_empty] as accumulator
- Use the [`MapSet.union/2` function][union]
- Use the [`MapSet.size/1` function][size]

## 8. Shiny for the win

- Use the [`MapSet.split_with/2` function][split_with]
- Use the [`String.starts_with?/2` function][starts_with]
- Use the [`MapSet.to_list/1` function][to_list]
- `MapSet.to_list/1` does not guarantee to return a sorted list

[mapset]: https://hexdocs.pm/elixir/MapSet.html
[enum]: https://hexdocs.pm/elixir/Enum.html
[new]: https://hexdocs.pm/elixir/MapSet.html#new/1
[member]: https://hexdocs.pm/elixir/MapSet.html#member?/2
[put]: https://hexdocs.pm/elixir/MapSet.html#put/2
[delete]: https://hexdocs.pm/elixir/MapSet.html#delete/2
[to_list]: https://hexdocs.pm/elixir/MapSet.html#to_list/1
[difference]: https://hexdocs.pm/elixir/MapSet.html#difference/2
[size]: https://hexdocs.pm/elixir/MapSet.html#size/1
[reduce]: https://hexdocs.pm/elixir/Enum.html#reduce/3
[intersection]: https://hexdocs.pm/elixir/MapSet.html#intersection/2
[new_empty]: https://hexdocs.pm/elixir/MapSet.html#new/0
[union]: https://hexdocs.pm/elixir/MapSet.html#union/2
[split_with]: https://hexdocs.pm/elixir/MapSet.html#split_with/2
[starts_with]: https://hexdocs.pm/elixir/String.html#starts_with?/2
