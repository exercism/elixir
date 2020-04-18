In this exercise, you need to translate some rules from the classic game pac-man into elixir functions.

You have four rules to translate, all related to the game states.

> Don't worry about how the paramaters are derived, just focus on combining the parameters to return the intended result.

### 1. Define if pac-man eats a ghost

Define the `Rules.eat_ghost?/2` function that takes two parameters (_if pac-man has a power pellet active_ and _if pac-man is touching a ghost_) and returns a boolean value if pac-man is able to eat the ghost. The function should return true only if pac-man has a power pellet active and is touching a ghost.

```elixir
Rules.eat_ghost?(false, true)
# => false
```

### 2. Define if pac-man scores

Define the `Rules.score?/2` function that takes two parameters (_if pac-man is touching a power pellet_ and _if pac-man is touching a dot_) and returns a boolean value if pac-man scored. The function should return true if pac-man is touching a power pellet or a dot.

```elixir
Rules.score?(true, true)
# => true
```

### 3. Define if pac-man loses

Define the `Rules.lose?/2` function that takes two parameters (_if pac-man has a power pellet active_ and _if pac-man is touching a ghost_) and returns a boolean value if pac-man loses. The function should return true if pac-man is touching a ghost and does not have a power pellet active.

```elixir
Rules.lose?(false, true)
# => true
```

### 4. Define if pac-man wins

Define the `Rules.win?/3` function that takes three parameters (_if pac-man has eaten all of the dots_, _if pac-man has a power pellet active_, and _if pac-man is touching a ghost_) and returns a boolean value if pac-man wins. The function should return true if pac-man has eaten all of the dots and has not lost based on the parameters defined in part 3.

```elixir
Rules.win?(false, true, false)
# => false
```
