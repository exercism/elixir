While planning a games night with friends, the group decides they will revisit their childhood favorites. Your German friend proposes _Mensch ärgere Dich nicht_ (_Man, Don't Get Angry_), a classic in many European countries (similar to the English _Ludo_ or the North American _Parcheesi_).

To prepare for the game, you decide to implement the dice rolling function in Elixir.

In _Mensch ärgere Dich nicht_, players roll one 6-sided die to determine their next move. If they are lucky and roll 6, they can roll and move again.

## 1. Do one 6-sided die roll

Implement the `d6/0` function that will randomly choose one integer between 1 and 6 on each call.

```elixir
MenschAergereDichNicht.d6()
# => 1
MenschAergereDichNicht.d6()
# => 5
```

## 2. Keep rolling as long as you roll sixes

Implement the `roll/0` function. It should return a stream of dice rolls. The dice rolls should follow the rules of the game. If I roll a six, I can roll again. Otherwise, stop rolling. Use the `d6/0` function defined in the previous step.

```elixir
MenschAergereDichNicht.roll() |> Enum.to_list()
# => [5]
MenschAergereDichNicht.roll() |> Enum.to_list()
# => [6, 3]
```

## 3. Allow using a rigged die

To make it easier to test your code, allow using a rigged die.

Extend the `roll/0` function. It should accept an optional argument - a function. If the argument is passed, use it to do the die roll. Otherwise, fall back to `MenschAergereDichNicht.d6/0`.

```elixir
MenschAergereDichNicht.roll(fn -> 3 end) |> Enum.to_list()
# => [3]
```
