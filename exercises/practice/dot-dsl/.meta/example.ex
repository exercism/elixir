defmodule Dot do
  # Normally matching on keywords is a bad idea as keyword lists can have
  # several orders (i.e. `[a: 1, b: 2]` and `[b: 2, a: 1]`). But in this case
  # only one keyword is allowed, so it's safe.
  defmacro graph(do: ast) do
    g = do_graph(ast)

    g |> Graph.canonical() |> Macro.escape()
  end

  defp do_graph(nil) do
    Graph.new()
  end

  defp do_graph({:__block__, _, stmts}) do
    Enum.reduce(stmts, Graph.new(), &do_stmt/2)
  end

  defp do_graph(stmt) do
    do_stmt(stmt, Graph.new())
  end

  defp do_stmt(stmt = {:graph, _, [kws]}, g) when is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.put_attrs(kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt({atom, _, nil}, g) when is_atom(atom) and atom != :-- do
    g |> Graph.add_node(atom)
  end

  defp do_stmt(stmt = {atom, _, [kws]}, g)
       when is_atom(atom) and atom != :-- and is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.add_node(atom, kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt({:--, _, [{a, _, nil}, {b, _, nil}]}, g)
       when is_atom(a) and is_atom(b) do
    g |> Graph.add_edge(a, b)
  end

  defp do_stmt(stmt = {:--, _, [{a, _, nil}, {b, _, [kws]}]}, g)
       when is_atom(a) and is_atom(b) and is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.add_edge(a, b, kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt(stmt, _) do
    raise_invalid_stmt(stmt)
  end

  defp raise_invalid_stmt(stmt) do
    raise ArgumentError, message: "Invalid statement: #{inspect(stmt)}"
  end
end

defmodule Graph do
  @moduledoc """
  A minimal implementation of a Graph, comprising
  of some nodes and edges between them.
  Nodes, edges and the graph itself may have
  attributes.
  """
  defstruct attrs: %{}, nodes: %{}, edges: []
  @type id :: atom
  @type vertex :: {id, map}
  @type edge :: {id, id, map}
  @type t :: %Graph{
          attrs: map,
          nodes: %{id => keyword},
          edges: [edge]
        }
  @type attrs :: map | keyword

  @doc """
  Returns a new empty graph
  """
  @spec new() :: t
  def new(), do: %Graph{}

  @doc """
  Sets attributes for the graph
  """
  @spec put_attrs(t, attrs) :: t
  def put_attrs(%Graph{} = g, attrs) do
    %{g | attrs: Enum.into(attrs, g.attrs)}
  end

  @doc """
  Add the node to the graph, with optional attributes.
  If the node was already present, simply merges the attributes.
  """
  @spec add_node(t, id, attrs) :: t
  def add_node(%Graph{} = g, id, attrs) do
    {_, nodes} =
      Map.get_and_update(g.nodes, id, fn cur ->
        {cur, Enum.into(attrs, cur || %{})}
      end)

    %{g | nodes: nodes}
  end

  def add_node(%Graph{} = g, id) do
    %{g | nodes: Map.put_new(g.nodes, id, %{})}
  end

  @doc """
  Adds an edge `from` -> `to` to the graph, with optional
  attributes. Both nodes will be automatically added if need be.
  Multiple edges between the same nodes may be added.
  """
  @spec add_edge(t, id, id, attrs) :: t
  def add_edge(%Graph{} = g, from, to, attrs \\ []) do
    edge = {from, to, Enum.into(attrs, %{})}
    %{(g |> add_node(from) |> add_node(to)) | edges: [edge | g.edges]}
  end

  @doc """
  Returns wether the two given graphs are equivalent or not
  """
  @spec equal?(t, t) :: boolean
  def equal?(%Graph{} = a, %Graph{} = b) do
    canonical(a) == canonical(b)
  end

  def equal?(%Graph{}, _other) do
    false
  end

  @doc """
  Returns an equivalent graph in a canonical form
  """
  @spec canonical(t) :: t
  def canonical(%Graph{} = g) do
    %{g | edges: g.edges |> Enum.sort()}
  end
end
