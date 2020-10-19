[Maps][maps] are a data structure that holds key-value pairs.

- Keys can be of any type, but must be unique.
- Values can be of any type, they do not have to be unique.
- Maps do not guarantee the order of their contents despite appearing to do so.
  - Their underlying implementation gives this misperception:
    - At small sized (<=32 entries), they are implemented as an ordered [Keyword list][keyword-list]
    - At larger sizes (>32 entries), they are implemented as a [hash array mapped trie][hamt] &#91;[1][stackoverflow]&#93;
- Maps can be declared with a literal form:

  ```elixir
  # An empty map
  %{}

  # A map with the atom key :a associated to the integer value 1
  %{a: 1}

  # A map with the string key "a" associated to the float value 2.0
  %{"a" => 2.0}

  # A map with the map key %{} with the list value [1,2,3]
  %{%{} => [1,2,3]}
  ```

- Maps can also be instantiated using [`Map.new`][map-new] from the [Map module][map-module]. This might be used if you already have an enumerable collection to turn into a list:

  ```elixir
  kw_list = [a: 1, b: 2]
  Map.new(kw_list)
  # => %{a: 1, b: 2}
  ```

- Values in a map can be accessed in many different way:

  ```elixir
  my_map = %{key: "value"}

  # with a dot if the key is an atom
  my_map.key
  # => "value"

  # with [], a syntax provided by the Access behaviour
  my_map[:key]
  # => "value"

  # with pattern matching
  %{key: x} = my_map
  x
  # => "value"

  # with Map.get/2
  Map.get(my_map, :key)
  # => "value"
  ```

- The [Map module][map-module], included with the standard library, has many useful functions for using maps.

  ```elixir
  Map.delete(%{a: 2, b: 3}, :a)
  # => %{b: 3}
  ```

- Maps implement the [`Enumerable`][enumerable] protocol, allowing use of [Enum module][enum] functions.
- [Anonymous functions][anon-fn] or [captured function references][captured-fn] are often required as arguments for [Map][map-module] and [Enum module][enum] functions

  ```elixir
  # Increment the value by one, if it is not found, update it with 0
  Map.update(%{a: 1}, :a, 0, &(&1 + 1))
  # => %{a: 2}

  # Sorting by a specific sub-value
  list = [{"A", 4}, {"B", 3}, {"C", 2}, {"D", 1}]
  Enum.sort_by(list, &Kernel.elem(&1, 1))
  # => [{"D", 1}, {"C", 2}, {"B", 3}, {"A", 4}]
  ```

[anon-fn]: https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions
[captured-fn]: https://elixir-lang.org/getting-started/modules-and-functions.html#function-capturing
[keyword-list]: https://elixir-lang.org/getting-started/keywords-and-maps.html#keyword-lists
[enum]: https://hexdocs.pm/elixir/Enumerable.html#content
[hamt]: https://en.wikipedia.org/wiki/Hash_array_mapped_trie
[maps]: https://elixir-lang.org/getting-started/keywords-and-maps.html#maps
[map-module]: https://hexdocs.pm/elixir/Map.html
[map-new]: https://hexdocs.pm/elixir/Map.html#new/0
[stackoverflow]: https://stackoverflow.com/a/40408469
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
