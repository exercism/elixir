In this exercise, you're implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

You have 7 functions to implement, all related to returning and manipulating a map of high score data.

## 1. Define a new high score map

To make a new high score map, define the `HighScore.new/0` function which doesn't take any parameters and returns a new, empty map of high scores.

```elixir
HighScore.new()
# => %{}
```

## 2. Add players to the high score map

To add a player to the high score map, define `HighScore.add_player/3`, which is a function which takes 3 parameters:

- The first parameter is the map of scores.
- The second parameter is the name of a player as a string.
- The third parameter is the score as an integer. The parameter is optional, implement the third parameter with a default value of 0.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 0, "José Valim"=> 486_373}
```

## 3. Remove players from the score map

To remove a player from the high score map, define `HighScore.remove_player/2`, which takes 2 parameters:

- The first parameter is the map of scores.
- The second parameter is the name of the player as a string.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.remove_player(score_map, "Dave Thomas")
# => %{}
```

## 4. Reset a player's score

To reset a player's score, define `HighScore.remove_player/2`, which takes 2 parameters:

- The first parameter is the map of scores.
- The second parameter is the name of the player as a string, whose score you wish to reset.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.reset_score(score_map, "José Valim")
# => %{"José Valim"=> 0}
```

## 5. Update a player's score

To update a players score by adding to the previous score, define `HighScore.update_player/2`, which takes 3 parameters:

- The first parameter is the map of scores.
- The second parameter is the name of the player as a string, whose score you wish to update.
- The third parameter is the score that you wish to **add** to the stored high score.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.update_score(score_map, "José Valim", 5)
# => %{"José Valim"=> 486_378}
```

## 6. Get a list of players with scores ordered by player name

To get a list of players ordered by name, define `HighScore.order_by_players/1`, which takes 1 parameter:

- The first parameter is the map of scores.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
# => %{"Dave Thomas" => 2_374}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 2_374, "José Valim"=> 486_373}
HighScore.order_by_players(score_map)
# => [{"Dave Thomas", 2_374}, {"José Valim", 486_373}]
```

## 7. Get a list of players ordered by player score in decreasing order

To get a list of players ordered by scores in decreasing order, define `HighScore.order_by_scores/1`, which takes 1 parameter:

- The first parameter is the map of scores.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
# => %{"Dave Thomas" => 2_374}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 2_374, "José Valim"=> 486_373}
HighScore.order_by_scores(score_map)
# => [{"José Valim", 486_373}, {"Dave Thomas", 2_374}]
```
