## General

- A [map][maps] is an associative data structure of key-value pairs.
- Elixir offers [many useful Map module functions in the standard library][map-module].

## 1. Define a new high score map

- It should return an empty [map][maps].
- [Map module][map-module] functions or literal forms can be useful.

## 2. Add players to the high score map

- The resulting map should be returned.
- [Map module][map-module] contains functions useful for manipulating maps. [One of them][map-put] deletes a key from a map.

## 3. Remove players from the score map

- The resulting map should be returned.
- [Map module][map-module] contains functions useful for manipulating maps. [One of them][map-delete] puts a value in a map under a given key.

## 4. Reset a player's score

- The resulting map should be returned with the player's score reset to an initial value.
- [Map module][map-module] contains functions useful for manipulating maps. [One of them][map-put] puts a value in a map under a given key.

## 5. Update a player's score

- The resulting map should be returned with the player's updated score.
- [Map module][map-module] contains functions useful for manipulating maps. [One of them][map-update] updates a value in a map under a given key.

## 6. Get a list of players

- [Map module][map-module] contains functions useful for manipulating maps. [One of them][map-keys] returns a list of all keys in a map.

[maps]: https://elixir-lang.org/getting-started/keywords-and-maps.html#maps
[map-module]: https://hexdocs.pm/elixir/Map.html
[map-put]: https://hexdocs.pm/elixir/Map.html#put/3
[map-delete]: https://hexdocs.pm/elixir/Map.html#delete/2
[map-update]: https://hexdocs.pm/elixir/Map.html#update/4
[map-keys]: https://hexdocs.pm/elixir/Map.html#keys/1
