# Hints

## General

- Read the documentation for [MapSet][mapset]
- The documentation for [Enum][enum] might be useful too

## 1. Start a collection

- [This is the most appropriate `MapSet` function][new] to solve the task

## 2. Grow the collection

- Use [this `MapSet` function][put] to add cards to your collection
- Use [that `MapSet` function][member] to check if you have a specific card in your collection

## 3. Start trading

- To check if you can trade a card, use [this `MapSet` function][member]
- To update your collection, use [this `MapSet` function][delete] and [that one][put]

## 4. There can be only one of each

- A `MapSet` has the property of only holding unique values
- Use [this `MapSet` function][new] to create a set and [that one][to_list] to turn it back into a list
- `MapSet`s do not have a notion of order, you should use [this `Enum` function][sort] to sort the cards, even if the tests pass without it

## 5. Cards they don't have

- Use [this `MapSet` function][difference] to check differences between collections
- Use [that `MapSet` function][size] to get the number of cards in a collection

## 6. Cards they all have

- [This `Enum` function][reduce] will be helpful to go through all of the collections
- Use pattern matching on the list to differentiate empty and non-empty lists
- [This `MapSet` function][intersection] will help you keep the common cards
- [This `MapSet` function][to_list] can create a list
- `MapSet`s do not have a notion of order, you should use [this `Enum` function][sort] to sort the cards, even if the tests pass without it

## 7. All of the cards

- [This `Enum` function][reduce] will be helpful to go through all of the collections
- Use [this `MapSet` function][new_empty] as accumulator
- [This `MapSet` function][union] will help you accumulate all cards
- [This `MapSet` function][size] will count how many cars you have

## 8. Shiny for the win

- Use [this `MapSet` function][split_with] to separate your collection
- Use [this `String` function][starts_with] to detect shiny cards
- [This `MapSet` function][to_list] can create a list
- `MapSet`s do not have a notion of order, you should use [this `Enum` function][sort] to sort the cards, even if the tests pass without it

[mapset]: https://hexdocs.pm/elixir/MapSet.html
[new]: https://hexdocs.pm/elixir/MapSet.html#new/1
[member]: https://hexdocs.pm/elixir/MapSet.html#member?/2
[put]: https://hexdocs.pm/elixir/MapSet.html#put/2
[delete]: https://hexdocs.pm/elixir/MapSet.html#delete/2
[to_list]: https://hexdocs.pm/elixir/MapSet.html#to_list/1
[difference]: https://hexdocs.pm/elixir/MapSet.html#difference/2
[size]: https://hexdocs.pm/elixir/MapSet.html#size/1
[intersection]: https://hexdocs.pm/elixir/MapSet.html#intersection/2
[new_empty]: https://hexdocs.pm/elixir/MapSet.html#new/0
[union]: https://hexdocs.pm/elixir/MapSet.html#union/2
[split_with]: https://hexdocs.pm/elixir/MapSet.html#split_with/2
[starts_with]: https://hexdocs.pm/elixir/String.html#starts_with?/2
[enum]: https://hexdocs.pm/elixir/Enum.html
[reduce]: https://hexdocs.pm/elixir/Enum.html#reduce/3
[sort]: https://hexdocs.pm/elixir/Enum.html#sort/1
