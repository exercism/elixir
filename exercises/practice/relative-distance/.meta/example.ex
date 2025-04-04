defmodule RelativeDistance do
  @doc """
  Find the degree of separation of two members given a given family tree.
  """
  @spec degree_of_separation(
          family_tree :: %{String.t() => [String.t()]},
          person_a :: String.t(),
          person_b :: String.t()
        ) :: nil | pos_integer()
  def degree_of_separation(family_tree, person_a, person_b) do
    family_tree
    |> build_family_graph()
    |> find_separation(person_b, [{person_a, 0}], MapSet.new())
  end

  defp build_family_graph(family_tree) do
    for {parent, children} <- family_tree, child <- children, reduce: %{} do
      graph ->
        siblings = children |> MapSet.new() |> MapSet.delete(child)

        graph
        |> Map.update(parent, MapSet.new([child]), &MapSet.put(&1, child))
        |> Map.update(child, MapSet.new([parent]), &MapSet.put(&1, parent))
        |> Map.update(child, siblings, &MapSet.union(&1, siblings))
    end
  end

  defp find_separation(_graph, _goal, [], _history), do: nil

  defp find_separation(_graph, goal, [{goal, count} | _], _history), do: count

  defp find_separation(graph, goal, [{person, count} | rest], history) do
    history = MapSet.put(history, person)

    next_steps =
      graph[person]
      |> Enum.reject(fn relative -> MapSet.member?(history, relative) end)
      |> Enum.map(fn relative -> {relative, count + 1} end)

    find_separation(graph, goal, rest ++ next_steps, history)
  end
end
