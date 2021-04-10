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
    update_in(g.nodes[id], fn cur ->
      Enum.into(attrs, cur || %{})
    end)
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
