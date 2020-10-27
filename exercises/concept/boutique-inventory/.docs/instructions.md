You are running an online fashion boutique. Your big annual sale is coming up, so you need to take stock of your inventory to make sure you're ready.

A single item in the inventory is represented by a map, and the whole inventory is a list of such maps.

```elixir
%{
  name: "White Shirt",
  price: 40,
  quantity_by_size: %{s: 3, m: 7, l: 8, xl: 4}
}
```

## 1. Sort items by price

Implement the `sort_by_price/1` function. It should take the inventory and return it sorted by item price, ascending.

```elixir
BoutiqueInventory.sort_by_price([
  %{price: 65, name: "Maxi Brown Dress", quantity_by_size: %{}},
  %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
  %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
  %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}}
])
# => [
#      %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}},
#      %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
#      %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
#      %{price: 65, name: "Maxi Brown Dress", price: 65, quantity_by_size: %{}}
#    ]
```

## 2. Find all items with missing prices

After sorting your inventory by price, you noticed that you must have made a mistake when you were taking stock and forgot to fill out prices for a few items.

Implement the `with_missing_price/1` function. It should take the inventory and return a list of items that do not have prices.

```elixir
BoutiqueInventory.with_missing_price([
  %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
  %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
  %{price: nil, name: "Denim Skirt", quantity_by_size: %{}},
  %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
])
# => [
#      %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
#      %{price: nil, name: "Denim Skirt", quantity_by_size: %{}},
#    ]
```

## 3. Increment the item's quantity

Some items were selling especially well, so you ordered more, in all sizes.

Implement the `increase_quantity/2` function. It should take a single item and a number `n`, and return that item with the quantity for each size increased by `n`.

```elixir
BoutiqueInventory.increase_quantity(
 %{
   name: "Polka Dot Skirt",
   price: 68,
   quantity_by_size: %{s: 3, m: 5, l: 3, xl: 4}
 },
 6
)
# => %{
#      name: "Polka Dot Skirt",
#      price: 68,
#      quantity_by_size: %{l: 9, m: 11, s: 9, xl: 10}
#    }

```

## 4. Calculate the item's total quantity

To know how much space you need in your storage, you need to know how many of each item you have in total.

Implement the `total_quantity/1` function. It should take a single item and return how many pieces you have in total, in any size.

```elixir
BoutiqueInventory.total_quantity(%{
  name: "Red Shirt",
  price: 62,
  quantity_by_size: %{s: 3, m: 6, l: 5, xl: 2}
})
# => 16
```
