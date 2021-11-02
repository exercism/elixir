defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}

  def build_tree(preorder, inorder) do
    p_length = length(preorder)
    i_length = length(inorder)
    p_set = MapSet.new(preorder)
    i_set = MapSet.new(inorder)

    cond do
      p_length != i_length -> {:error, "traversals must have the same length"}
      p_set != i_set -> {:error, "traversals must have the same elements"}
      p_length != MapSet.size(p_set) -> {:error, "traversals must contain unique items"}
      true -> {:ok, do_build_tree(preorder, inorder)}
    end
  end

  defp do_build_tree([], []), do: {}

  defp do_build_tree([root | preorder], inorder) do
    {in_left, in_right, pre_left, pre_right} = split(root, inorder, preorder)

    {do_build_tree(pre_left, in_left), root, do_build_tree(pre_right, in_right)}
  end

  defp split(root, [root | inorder], preorder), do: {[], inorder, [], preorder}

  defp split(root, [i | inorder], [p | preorder]) do
    {in_left, in_right, pre_left, pre_right} = split(root, inorder, preorder)

    {[i | in_left], in_right, [p | pre_left], pre_right}
  end
end
