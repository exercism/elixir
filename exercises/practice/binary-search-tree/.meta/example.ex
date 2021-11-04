defmodule BinarySearchTree do
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  def insert(nil, node_value), do: new(node_value)

  def insert(%{data: data, left: left, right: right}, node_value) do
    if node_value <= data do
      %{data: data, left: insert(left, node_value), right: right}
    else
      %{data: data, left: left, right: insert(right, node_value)}
    end
  end

  def in_order(tree) do
    in_order(tree, []) |> Enum.reverse()
  end

  defp in_order(nil, accum) do
    accum
  end

  defp in_order(tree, accum) do
    left_side = in_order(tree.left, accum)
    middle = [tree.data | left_side]
    in_order(tree.right, middle)
  end
end
