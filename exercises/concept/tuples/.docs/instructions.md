While preparing to bake cookies for your friends, you have found that you have to convert some of the ingredients used in the recipe for your friends. Being only familiar with the metric system, you need to come up with a way to convert common US baking measurements to millilitres (mL) for your own ease.

Use this conversion chart for your solution:

| Unit to convert | volume | in millilitres (mL) |
| --------------- | ------ | ------------------- |
| mL              | 1      | 1                   |
| US cup          | 1      | 240                 |
| US fluid ounce  | 1      | 30                  |
| US teaspoon     | 1      | 5                   |
| US tablespoon   | 1      | 15                  |

Being a talented programmer in training, you decide to use millilitres as a transition unit to facilitate the conversion from any unit listed to any other (even itself)

## 1. Get the numeric component from a volume-pair

- Given a volume-pair tuple, `{:cup, 2.0}`, return just the numeric component.

```elixir
KitchenCalculator.get_volume({:cup, 2.0})
# => 2.0
```

## 2. Convert the volume-pair to millilitres

- Given a volume-pair tuple, `{:cup, 2.5}`, convert the volume to millilitres using the conversion chart.

- use multiple function clauses and pattern matching to create the functions for each unit
  - the atoms used to denote each unit are: `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:millilitre`
- return the conversion wrapped in a tuple

```elixir
KitchenCalculator.to_millilitre({:cup, 2.5})
# => {:millilitre, 600.0}
```

## 3. Convert the millilitre volume-pair to another unit

- Given a volume-pair tuple, `{:millilitre, 1320.0}`, and the desired unit, `:cup`, convert the volume to the desired unit using the conversion chart.
- use multiple function clauses and pattern matching to create the functions for each unit
  - the atoms used to denote each unit are: `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:millilitre`

```elixir
KitchenCalculator.from_millilitre({:millilitre, 1320.0}, :cup)
# => {:cup, 5.5}
```

## 4. Convert from any unit to any unit

- Given a volume-pair tuple, `{:teaspoons, 9.0}`, and the desired unit, `:tablespoon`, convert the volume to the desired unit

```elixir
KitchenCalculator.convert({:teaspoons, 9.0}, :tablespoon)
# => {:tablespoon, 3.0}
```
