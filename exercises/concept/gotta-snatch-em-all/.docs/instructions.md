# Instructions

Your nostalgia for Blorkemon™️ cards is showing no sign of slowing down, you even started collecting them again, and you are getting your friends to join you.

In this exercise, a card collection is represented by a `MapSet`, since duplicate cards are not important when your goal is to get all existing cards.

## 1. Start a collection

You really want your friends to join your Blorkemon™️ madness, and the best way is to kickstart their collection by giving them one card.

Implement `GottaSnatchEmAll.new_collection`, which transforms a card into a collection.

```elixir
GottaSnatchEmAll.new_collection("Newthree")
# => MapSet.new(["Newthree"])
```

## 2. Grow the collection

Once you have a collection, it takes a life of its own and must grow.

Implement `GottaSnatchEmAll.add_card`, which takes a card and a collection, and returns a tuple with two values: a boolean that indicates if the card was already in the collection, and the collection with the card added.

```elixir
GottaSnatchEmAll.add_card("Scientuna", MapSet.new(["Newthree"]))
# => {false, MapSet.new(["Newthree", "Scientuna"])}
```

## 3. Start trading

Now that your friends are Blorkemon™️ crazy again, you can use this to grow your own collection by trading cards.

Not every trade is worth doing, or can be done at all.
You cannot trade a card you don't have, and you shouldn't trade a card for one that you already have.

Implement `GottaSnatchEmAll.trade_card`, that takes two cards to trade (yours and theirs) and your current collection.
The return value is a tuple of two values: a boolean stating if the trade is possible and worth doing, and the collection you would end up with if you did the trade (even if it's not actually possible).

```elixir
GottaSnatchEmAll.trade_card("Scientuna", "Newthree", MapSet.new(["Scientuna"]))
# => {true, MapSet.new(["Newthree"])}
```

## 4. There can be only one of each

You find an old stash of cards in a flea market.
You must sort the cards and remove the duplicates to compare the list to your collection.

Implement `GottaSnatchEmAll.remove_duplicates` which will sort a list of cards and return a list of sorted, unique cards.

```elixir
GottaSnatchEmAll.remove_duplicates(["Newthree", "Newthree", "Newthree", "Scientuna"])
# => ["Newthree", "Scientuna"]
```

## 5. Cards they don't have

Time to feel good about your collection.

Implement `GottaSnatchEmAll.extra_cards`, which takes your collection and some other collection, and returns the number of cards that the other collection doesn't have.

```elixir
GottaSnatchEmAll.extra_cards(MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"]))
# => 0
```

## 6. Cards they all have

You and your Blorkemon™️ enthusiast friends gather and wonder which cards are the most common.

Implement `GottaSnatchEmAll.boring_cards`, which takes a list of collections and returns a list of sorted cards that all collections have.

```elixir
GottaSnatchEmAll.boring_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])])
# => ["Scientuna"]
```

## 7. All of the cards

Do you and your friends collectively own all of the Blorkemon™️ cards?

Implement `GottaSnatchEmAll.total_cards`, which takes a list of collections and returns the total number of different cards in the all of the collections.

```elixir
GottaSnatchEmAll.total_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])])
# => 2
```

## 8. Shiny for the win

Your nephew is coming to visit you soon, and you feel like impressing him.
Kids like shiny things right?
Blorkemon™️ cards can be shiny!

Implement `GottaSnatchEmAll.split_shiny_cards`, which takes a collection and returns a tuple with two lists of sorted cards: one with all the cards that start with `"Shiny"` and one with the other cards.

```elixir
GottaSnatchEmAll.split_shiny_cards(MapSet.new(["Newthree", "Scientuna", "Shiny Scientuna"]))
# => {["Shiny Scientuna"], ["Newthree", "Scientuna"]}
```
