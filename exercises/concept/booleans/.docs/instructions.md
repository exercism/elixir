In this exercise, you need to translate some rules from the classic game Pac-Man into Elixir functions.

You have four rules to translate, all related to the game states.

> Don't worry about how the parameters are derived, just focus on combining the parameters to return the intended result.

## 1. Define if Pac-Man eats a ghost

Define the `Rules.eat_ghost?/2` function that takes two parameters (_if Pac-Man has a power pellet active_ and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man is able to eat the ghost. The function should return true only if Pac-Man has a power pellet active and is touching a ghost.

```elixir
Rules.eat_ghost?(false, true)
# => false
```

## 2. Define if Pac-Man scores

Define the `Rules.score?/2` function that takes two parameters (_if Pac-Man is touching a power pellet_ and _if Pac-Man is touching a dot_) and returns a boolean value if Pac-Man scored. The function should return true if Pac-Man is touching a power pellet or a dot.

```elixir
Rules.score?(true, true)
# => true
```

## 3. Define if Pac-Man loses

Define the `Rules.lose?/2` function that takes two parameters (_if Pac-Man has a power pellet active_ and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man loses. The function should return true if Pac-Man is touching a ghost and does not have a power pellet active.

```elixir
Rules.lose?(false, true)
# => true
```

## 4. Define if Pac-Man wins

Define the `Rules.win?/3` function that takes three parameters (_if Pac-Man has eaten all of the dots_, _if Pac-Man has a power pellet active_, and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man wins. The function should return true if Pac-Man has eaten all of the dots and has not lost based on the parameters defined in part 3.

```elixir
Rules.win?(false, true, false)
# => false
```
