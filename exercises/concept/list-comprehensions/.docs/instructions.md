Your work at the online fashion boutique store continues. You come up with the idea for a website feature where a outfit is suggested to the user. While you want to give lots of suggestions, you don't want to give bad suggestions, so you decide to use a list comprehension since you can easily _generate_ outfit combinations, then _filter_ them by some criteria.

Clothing items are stored as a map:

```elixir
%{
  item_name: "Descriptive Name",
  price: 99.00,
  base_color: "red"
}
```

## 1. Suggest a combination

Implement `get_combinations/3` to take a list of tops, a list of bottoms, and keyword list of options. For now, set options to default to an empty keyword list. The function should return the cartesian product of the lists.

```elixir
tops = [
  %{item_name: "Dress shirt"},
  %{item_name: "Casual shirt"}
]
bottoms = [
  %{item_name: "Jeans"},
  %{item_name: "Dress trousers"}
]
BoutiqueSuggestions.get_combinations(tops, bottoms)
# => [
#      {%{item_name: "Dress shirt"}, %{item_name: "Jeans"}}
#      {%{item_name: "Dress shirt"}, %{item_name: "Dress trousers"}}
#      {%{item_name: "Casual shirt"}, %{item_name: "Jeans"}}
#      {%{item_name: "Casual shirt"}, %{item_name: "Dress trousers"}}
#    ]
```

## 2. Filter out clashing outfits

Each piece of clothing has a `:base_color` field, use this field to filter out all combinations where the top and the bottom have the same base color.

```elixir
tops = [
  %{item_name: "Dress shirt", base_color: "blue"},
  %{item_name: "Casual shirt", base_color: "black"}
]
bottoms = [
  %{item_name: "Jeans", base_color: "blue"},
  %{item_name: "Dress trousers", base_color: "black"}
]
BoutiqueSuggestions.get_combinations(tops, bottoms)
# => [
#      {%{item_name: "Dress shirt"}, %{item_name: "Dress trousers"}}
#      {%{item_name: "Casual shirt"}, %{item_name: "Jeans"}}
#    ]
```

## 3. Filter by combination price

Each piece of clothing has a `:price` field associated with it. While you want to give lots of suggestions, you want to be able to provide users an opportunity to select a price within their budget. From the keyword list of options, use `:maximum_price` to filter out combinations where the price of the top and bottom exceed the maximum price.

If no maximum_price is specified, the default should be `100.00`

```elixir
tops = [
  %{item_name: "Dress shirt", base_color: "blue", price: 35},
  %{item_name: "Casual shirt", base_color: "black", price: 20}
]
bottoms = [
  %{item_name: "Jeans", base_color: "blue", price: 30},
  %{item_name: "Dress trousers", base_color: "black", price: 75}
]
BoutiqueSuggestions.get_combinations(tops, bottoms, maximum_price: 50)
# => [
#      {%{item_name: "Casual shirt"}, %{item_name: "Jeans"}}
#    ]
```
