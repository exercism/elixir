defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{registry: %{}, next_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state ->
      Map.values(state.registry)
    end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{registry: registry, next_id: next_id} = state ->
      new_plot = %Plot{plot_id: next_id, registered_to: register_to}
      updated = Map.put(registry, next_id, new_plot)
      {new_plot, %{state | registry: updated, next_id: next_id + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{registry: registry} = state ->
      updated = Map.delete(registry, plot_id)
      %{state | registry: updated}
    end)
  end

  def get_registration(pid, plot_id) do
    registration =
      Agent.get(pid, fn state ->
        state.registry[plot_id]
      end)

    case registration do
      nil -> {:not_found, "plot is unregistered"}
      _ -> registration
    end
  end
end
