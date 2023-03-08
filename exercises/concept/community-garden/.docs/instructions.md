# Instructions

Your community association has asked you to implement a simple registry application to manage the community garden registrations. The `Plot` struct has already been provided for you.

## 1. Open the garden

Implement the `CommunityGarden.start/1` function, it should receive an optional keyword list of options to pass forward to the _agent process_. The garden's initial state should be initialized to represent an empty collection of plots. It should return an `:ok` tuple with the garden's pid.

```elixir
{:ok, pid} = CommunityGarden.start()
# => {:ok, #PID<0.112.0>}
```

## 2. List the registrations

Implement the `CommunityGarden.list_registrations/1` function. It should receive the `pid` for the community garden. It should return a list of the stored plots that are registered.

```elixir
CommunityGarden.list_registrations(pid)
# => []
```

> At this point, we haven't added the ability to register a plot, so this list should be empty

## 3. Register plots to a person

Implement the `CommunityGarden.register/2` function. It should receive the `pid` for the community garden and a name to register the plot. It should return the `Plot` struct with the plot's id and person registered to when it is successful.

The ids should be incremental and unique. You can keep an id counter in the agent's state.

```elixir
CommunityGarden.register(pid, "Emma Balan")
# => %Plot{plot_id: 1, registered_to: "Emma Balan"}
CommunityGarden.list_registrations(pid)
# => [%Plot{plot_id: 1, registered_to: "Emma Balan"}]
```

## 4. Release plots

Implement the `CommunityGarden.release/2` function. It should receive the `pid` and `id` of the plot to be released. It should return `:ok` on success. When a plot is released, the id is not re-used, it is used as a unique identifier only.

```elixir
CommunityGarden.release(pid, 1)
# => :ok
CommunityGarden.list_registrations(pid)
# => []
```

## 5. Get a registered plot

Implement the `CommunityGarden.get_registration/2` function. It should receive the `pid` and `id` of the plot to be checked. It should return the plot if it is registered, and `:not_found` if it is unregistered.

```elixir
CommunityGarden.get_registration(pid, 1)
# => %Plot{plot_id: 1, registered_to: "Emma Balan"}
CommunityGarden.get_registration(pid, 7)
# => {:not_found, "plot is unregistered"}
```
