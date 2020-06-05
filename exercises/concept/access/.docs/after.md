Elixir uses code [_Behaviours_][behaviours] to provide a common generic interfaces while facilitating specific implementations for each module which implements the behavior. When creating a _Behaviour_ in Elixir, the behaviour-defining module contains general logic for a common pattern and which callback functions must be implemented by modules using the behaviour. Modules that implement the _Behaviour_ can then write callback functions which then operate on its own specific needs. Saša Jurić writes in his book, Elixir in Action, that this is an extension of Erlang _Behaviours_ which are commonly seen in modules like [`GenServer`][genserver], [`Supervisor`][supervisor], and [`Application`][application].[1]

In this exercise we looked at the _Access Behaviour_ where the [`Access`][access] module defines the callbacks required for the common pattern. The [`Map`][map] module then implements the required callbacks [`fetch/2`][map-fetch], [`get_and_update/3`][map-get-and-update], and [`pop/2`][map-pop]

## Access Behaviour

- _Access Behaviour_ provides a common interface for retrieving key-based data from a data structure.
  - Like from a map or keyword list data structure.
  - To use the behavior, you may follow a bound variable with _square brackets_ and then use the key to retrieve the value associated with that key.
  - If the key does not exist in the data structure, then `nil` is returned.
  - This can be a source of unintended behavior, because it does not raise an error.

```elixir
# Suppose we have these three maps defined (note the difference in the key type)
my_map = %{key: "my value"}
your_map = %{"key" => "your value"}
our_map = %{level_one: %{level_two: 3}}

# Obtain the value using the Access Behavior
my_map[:key] == "my value"
your_map[:key] == nil
our_map[:level_one][:level_two] == 3
```

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

## References

[1] S. Jurić, Elixir in action, Second edition, Manning Publications Co, Shelter Island, NY, 2019.

[kernel]: https://hexdocs.pm/elixir/Kernel.html#content
[behaviors]: https://hexdocs.pm/elixir/Module.html#module-behaviour
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
