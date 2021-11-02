defmodule Pov do
  # Structs and types

  @typedoc """
  A tree, which is made of a node with several branches
  """
  @type tree :: {any, [tree]}

  defmodule Crumb do
    defstruct [:parent, left_siblings: [], right_siblings: []]
    @type t :: %Crumb{parent: any, left_siblings: [Pov.tree()], right_siblings: [Pov.tree()]}
  end

  defmodule Zipper do
    defstruct [:focus, genealogy: []]
    @type t :: %Zipper{focus: Pov.tree(), genealogy: [Crumb.t()]}
  end

  # Core functions

  @doc """
  Reparent a tree on a selected node.
  """
  @spec from_pov(tree :: tree, node :: any) :: {:ok, tree} | {:error, atom}
  def from_pov(tree, node) do
    case tree |> zip |> search(node) do
      {:ok, zipper} -> {:ok, reparent(zipper)}
      _ -> {:error, :nonexistent_target}
    end
  end

  @doc """
  Finds a path between two nodes
  """
  @spec path_between(tree :: tree, from :: any, to :: any) :: {:ok, [any]} | {:error, atom}
  def path_between(tree, from, to) do
    case tree |> zip |> search(from) do
      {:ok, zipper} ->
        case zipper |> reparent |> zip |> search(to) do
          {:ok, zipper_path} -> {:ok, get_path(zipper_path)}
          _ -> {:error, :nonexistent_destination}
        end

      _ ->
        {:error, :nonexistent_source}
    end
  end

  defp search(%Zipper{focus: {node, _children}} = zipper, node), do: {:ok, zipper}

  defp search(%Zipper{} = zipper, node) do
    case zipper |> down |> search(node) do
      {:ok, z} -> {:ok, z}
      _ -> zipper |> right |> search(node)
    end
  end

  defp search(nil, _node), do: nil

  defp reparent(%Zipper{focus: tree, genealogy: []}), do: tree

  defp reparent(%Zipper{
         focus: {node, children},
         genealogy: [
           %Crumb{parent: parent, left_siblings: left, right_siblings: right} | grandparent
         ]
       }) do
    {node, [reparent(%Zipper{focus: {parent, left ++ right}, genealogy: grandparent}) | children]}
  end

  defp get_path(%Zipper{focus: {node, _children}, genealogy: genealogy}) do
    parents = Enum.map(genealogy, fn %Crumb{parent: parent} -> parent end)

    Enum.reverse([node | parents])
  end

  # Zipper navigation

  defp zip(tree), do: %Zipper{focus: tree}

  defp down(%Zipper{focus: {value, [child | children]}, genealogy: genealogy}) do
    %Zipper{
      focus: child,
      genealogy: [%Crumb{parent: value, right_siblings: children} | genealogy]
    }
  end

  defp down(_zipper), do: nil

  defp right(%Zipper{
         focus: tree,
         genealogy: [
           %Crumb{left_siblings: left, right_siblings: [right | righties]} = crumb | grandparents
         ]
       }) do
    %Zipper{
      focus: right,
      genealogy: [
        %Crumb{crumb | left_siblings: [tree | left], right_siblings: righties} | grandparents
      ]
    }
  end

  defp right(_zipper), do: nil
end
