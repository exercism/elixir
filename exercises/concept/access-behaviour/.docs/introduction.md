Elixir uses code _Behaviours_ to provide a common generic interfaces while facilitating specific implementations for each module which implements it. One such common example is the _Access Behaviour_.

## Access Behaviour

The _Access Behaviour_ provides a common interface for retrieving key-based data from a data structure: like from a map data structure. Elixir supports the _Access Behaviour_ for maps and keyword lists, but let's look at its use for maps to get a feel for it. _Access Behaviour_ specifies that when you have a map, you may follow it with _square brackets_ and then use the key to retrieve the value associated with that key.

```elixir
# Suppose we have these two maps defined (note the difference in the key type)
my_map = %{key: "my value"}
your_map = %{"key" => "your value"}

# Obtain the value using the Access Behavior
my_map[:key] == "my value"
your_map[:key] == nil
```

If the key does not exist in the data structure, then nil is returned. This can be a source of unintended behavior, because it does not raise an error.
