defmodule Pov do
  @typedoc """
  A tree, which is made of a node with several branches
  """
  @type tree :: {any, [tree]}

  defmodule Zipper do
    defstruct(focus, genealogy: [])
  end

  defmodule Crumb do
    defstruct(parent, left_siblings: [], right_siblings: [])
  end

  @doc """
  Reparent a tree on a selected node.
  """
  @spec from_pov(tree :: tree, node :: any) :: tree | {:error, atom}
  def from_pov(tree, node) do
    # Implement this function
    zipper = zip(tree)

    case search(zipper, node) do
      {:ok, z} -> reparent(z)
      {:error, :not_found} -> {:error, :nonexistent_target}
    end
  end

  def zip(tree), do: %Zipper{focus: tree}

  def down(%Zipper{focus: {value, [child | children]}, genealogy: genealogy}) do
    %Zipper{
      focus: child,
      genealogy: [%Crumb{parent: value, right_siblings: children} | genealogy]
    }
  end

  def down(_zipper), do: nil

  def up(%Zipper{
        focus: tree,
        genealogy: [
          %Crumble{parent: parent, left_siblings: left, right_siblings: right} | grandparents
        ]
      }) do
    %Zipper{focus: {parent, left ++ [tree | right]}, genealogy: grandparents}
  end

  def up(_zipper), do: nil

  def left(%Zipper{
        focus: tree,
        genealogy: [
          %Crumble{parent: parent, left_siblings: [left | lefties], right_siblings: right}
          | grandparents
        ]
      }) do
        %Zipper{focus: left, genealogy: [ |grandparents] }
  end

  def search(%Zipper{focus: {node, _children}} = zipper, node), do: {:ok, zipper}

  def search(%Zipper{focus: {value, children}, genealogy: genealogy}, node) do
  end

  def reparent(%Zipper{focus: tree, genealogy: []}), do: tree

  def reparent(%Zipper{focus: {node, children}, genealogy: [parent | grandparent]}) do
    # {node, [ reparent(%zip(parent, grandparent) | children]}
  end

  @doc """
  Finds a path between two nodes
  """
  @spec path_between(tree :: tree, from :: any, to :: any) :: [any] | {:error, atom}
  def path_between(tree, from, to) do
    # Implement this function
  end
end
