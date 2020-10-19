Elixir uses [_Behaviours_][behaviours] to provide common generic interfaces while facilitating specific implementations for each module which implements the behavior. One of those behaviours is the _Access Behaviour_.

The _Access Behaviour_ provides a common interface for retrieving key-based data from a data structure. It is implemented for maps and keyword lists.

The [`Access`][access] module defines the callbacks required for the interface. The [`Map`][map] and [`Keyword`][keyword] modules then implements the required callbacks [`fetch/2`][map-fetch], [`get_and_update/3`][map-get-and-update], and [`pop/2`][map-pop]

To use the behavior, you may follow a bound variable with _square brackets_ and then use the key to retrieve the value associated with that key. Maps support atom and string keys, while keyword lists only atom keys.

```elixir
my_map = %{key: "my value"}
my_map[:key]
# => "my value"
```

If the key does not exist in the data structure, then `nil` is returned. This can be a source of unintended behavior, because it does not raise an error.

```elixir
my_map = %{key: "my value"}
my_map[:wrong_key][:other_wrong_key]
# => nil
```

Structs do not implement the Access behaviour.

## Access shortcuts

- [`Kernel`][kernel] provides several functions which make using nested data easier with the access behavior. See these links to the library documentation:
  - [`get_in/2`][get-in-2]
  - [`get_and_update_in/2`][get-and-update-in-2]
  - [`get_and_update_in/3`][get-and-update-in-3]
  - [`pop_in/1`][pop-in-1]
  - [`pop_in/2`][pop-in-2]
  - [`put_in/2`][put-in-2]
  - [`put_in/3`][put-in-3]
  - [`update_in/2`][update-in-2]
  - [`update_in/3`][update-in-3]

[kernel]: https://hexdocs.pm/elixir/Kernel.html#content
[behaviours]: https://hexdocs.pm/elixir/Module.html#module-behaviour
[genserver]: https://hexdocs.pm/elixir/GenServer.html#content
[supervisor]: https://hexdocs.pm/elixir/Supervisor.html#content
[application]: https://hexdocs.pm/elixir/Application.html#content
[access]: https://hexdocs.pm/elixir/Access.html#content
[map]: https://hexdocs.pm/elixir/Map.html#content
[map-fetch]: https://hexdocs.pm/elixir/Map.html#fetch/2
[map-get-and-update]: https://hexdocs.pm/elixir/Map.html#get_and_update/3
[map-pop]: https://hexdocs.pm/elixir/Map.html#pop/3
[get-in-2]: https://hexdocs.pm/elixir/Kernel.html#get_in/2
[get-and-update-in-2]: https://hexdocs.pm/elixir/Kernel.html#get_and_update_in/2
[get-and-update-in-3]: https://hexdocs.pm/elixir/Kernel.html#get_and_update_in/3
[pop-in-1]: https://hexdocs.pm/elixir/Kernel.html#pop_in/1
[pop-in-2]: https://hexdocs.pm/elixir/Kernel.html#pop_in/2
[put-in-2]: https://hexdocs.pm/elixir/Kernel.html#put_in/2
[put-in-3]: https://hexdocs.pm/elixir/Kernel.html#put_in/3
[update-in-2]: https://hexdocs.pm/elixir/Kernel.html#update_in/2
[update-in-3]: https://hexdocs.pm/elixir/Kernel.html#update_in/3
[keyword]: https://hexdocs.pm/elixir/Keyword.html
