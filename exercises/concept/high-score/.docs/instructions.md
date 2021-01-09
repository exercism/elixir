In this exercise, you're implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

## 1. Define a new high score map

To make a new high score map, define the `HighScore.new/0` function which doesn't take any arguments and returns a new, empty map of high scores.

```elixir
HighScore.new()
# => %{}
```

## 2. Add players to the high score map

To add a player to the high score map, define `HighScore.add_player/3`, which is a function which takes 3 arguments:

- The first argument is the map of scores.
- The second argument is the name of a player as a string.
- The third argument is the score as an integer. The argument is optional, implement the third argument with a default value of 0.

Store the default initial score in a module attribute. It will be needed again.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 0, "José Valim"=> 486_373}
```

## 3. Remove players from the score map

To remove a player from the high score map, define `HighScore.remove_player/2`, which takes 2 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.remove_player(score_map, "Dave Thomas")
# => %{}
```

## 4. Reset a player's score

To reset a player's score, define `HighScore.reset_score/2`, which takes 2 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string, whose score you wish to reset.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.reset_score(score_map, "José Valim")
# => %{"José Valim"=> 0}
```

## 5. Update a player's score

To update a players score by adding to the previous score, define `HighScore.update_player/2`, which takes 3 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string, whose score you wish to update.
- The third argument is the score that you wish to **add** to the stored high score.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.update_score(score_map, "José Valim", 5)
# => %{"José Valim"=> 486_378}
```

## 6. Get a list of players

To get a list of players, define `HighScore.get_players/1`, which takes 1 argument:

- The first argument is the map of scores.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
# => %{"Dave Thomas" => 2_374}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 2_374, "José Valim"=> 486_373}
HighScore.get_players(score_map)
# => ["Dave Thomas", "José Valim"]
```
