In this exercise, you need to translate some rules from the classic game Pac-man into elixir functions.

You have four rules to translate, all related to the game states.

> Don't worry about how the paramaters are derived, just focus on combining the parameters to return the intended result.

### 1. Define if pac-man can eat a ghost

Define the `Rules.eat_ghost?/2` function that takes two parameters (_if pac-man ate a pill_ and _if pac-man touched a ghost_) and returns a boolean value if pac-man is able to eat the ghost.  The function should return true only if pac-man has eaten a pill and touched a ghost.

```elixir
Rules.eat_ghost?(false, true)
# => false
```

### 2. Define if pac-man scores

Define the `Rules.score?/2` function that takes two parameters (_if pac-man ate a pill_ and _if pac-man ate a dot_) and returns a boolean value if pac-man scored.  The function should return true if pac-man has eaten a pill and/or a dot.

```elixir
Rules.score?(true, true)
# => true
```

### 3. Define if pac-man loses

Define the `Rules.lose?/2` function that takes two parameters (_if pac-man ate a pill_ and _if pac-man touched a ghost_) and returns a boolean value if pac-man loses.  The function should return true if pac-man has touched a ghost and not eaten a pill.

```elixir
Rules.lose?(false, true)
# => true
```

### 4. Define if pac-man wins

Define the `Rules.wins?/1` function that takes three parameters (_if pac-man ate all of the dots pill_, _if pac-man ate a pill_, and _if pac-man touched a ghost_) and returns a boolean value if pac-man wins.  The function should return true if pac-man has eaten all of the dots and has not lost based on the function defined in part 3.

```elixir
Rules.wins?(false, true, false)
# => false
```
