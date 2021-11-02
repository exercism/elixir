defmodule GoCounting do
  @type position :: {integer, integer}
  @type owner :: %{owner: atom, territory: [position]}
  @type territories :: %{white: [position], black: [position], none: [position]}

  @doc """
  Return the owner and territory around a position

  """
  @spec territory(board :: String.t(), position :: position) ::
          {:ok, owner} | {:error, String.t()}
  def territory(board, {x, y} = pos) do
    size_x = String.split(board, "\n") |> hd |> String.length()
    size_y = String.split(board, "\n", trim: true) |> length()

    if x < 0 or x >= size_x or y < 0 or y >= size_y do
      {:error, "Invalid coordinate"}
    else
      owner =
        board
        |> make_graph
        |> expand_territory([pos])
        |> get_owner

      {:ok, owner}
    end
  end

  @doc """
  Return all white, black and neutral territories
  """
  @spec territories(board :: String.t()) :: territories
  def territories(board) do
    graph = make_graph(board)

    empties = for {pos, {:none, _neighbors}} <- graph, do: pos

    territories(graph, empties, %{white: [], black: [], none: []})
  end

  defp territories(_graph, [], territories), do: territories

  defp territories(graph, [pos | positions], territories) do
    %{owner: owner, territory: territory} =
      graph
      |> expand_territory([pos])
      |> get_owner

    positions = Enum.reject(positions, &(&1 in territory))
    territories = %{territories | owner => Enum.sort(territories[owner] ++ territory)}

    territories(graph, positions, territories)
  end

  defp to_color(?W), do: :white
  defp to_color(?B), do: :black
  defp to_color(?_), do: :none

  defp make_graph(board) do
    board =
      board
      |> String.split("\n", trim: true)
      |> Enum.map(fn row -> row |> to_charlist |> Enum.map(&to_color/1) end)

    left_right_edges =
      for {[color], r} <- Enum.with_index(board) do
        # For rows with a single column we cannot use zip
        %{{0, r} => {color, []}}
      end ++
        for {row, r} <- Enum.with_index(board),
            {{cell, right_cell}, c} <- Enum.zip(row, tl(row)) |> Enum.with_index() do
          # For rows with multiple columns, we zip
          %{{c, r} => {cell, [{c + 1, r}]}, {c + 1, r} => {right_cell, [{c, r}]}}
        end

    top_down_edges =
      case board do
        [row] ->
          for {color, c} <- Enum.with_index(row), do: %{{c, 0} => {color, []}}

        _ ->
          for {{row, row_below}, r} <- Enum.zip(board, tl(board)) |> Enum.with_index(),
              {{cell, below_cell}, c} <- Enum.zip(row, row_below) |> Enum.with_index() do
            %{{c, r} => {cell, [{c, r + 1}]}, {c, r + 1} => {below_cell, [{c, r}]}}
          end
      end

    Enum.reduce(
      left_right_edges ++ top_down_edges,
      %{},
      &Map.merge(&1, &2, fn _key, {cell, n1}, {cell, n2} -> {cell, n1 ++ n2} end)
    )
  end

  defp expand_territory(graph, positions, visited \\ MapSet.new())
  defp expand_territory(_graph, [], _visited), do: []

  defp expand_territory(graph, [pos | positions], visited) do
    {color, neighbors} =
      case graph[pos] do
        {:white, _neighbors} ->
          {:white, []}

        {:black, _neighbors} ->
          {:black, []}

        {:none, neighbors} ->
          {:none, Enum.reject(neighbors, &(&1 in visited))}
      end

    [{pos, color} | expand_territory(graph, neighbors ++ positions, MapSet.put(visited, pos))]
  end

  defp get_owner(territory) do
    empties = for {pos, :none} <- territory, do: pos
    colors = for {_pos, color} when color != :none <- territory, do: color

    %{
      territory: Enum.sort(empties),
      owner:
        case {Enum.empty?(empties), Enum.uniq(colors)} do
          {false, [:white]} -> :white
          {false, [:black]} -> :black
          _ -> :none
        end
    }
  end
end
