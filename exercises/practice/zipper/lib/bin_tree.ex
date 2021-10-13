defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """

  @type t :: %BinTree{value: any, left: t() | nil, right: t() | nil}

  defstruct [:value, :left, :right]
end

defimpl Inspect, for: BinTree do
  import Inspect.Algebra

  # A custom inspect instance purely for the tests, this makes error messages
  # much more readable.
  #
  # For example:
  #
  # - %BinTree{value: 3, left: nil, right: nil}
  #   becomes
  #   (3::)
  #
  # - %BinTree{value: 3, left: nil, right: %BinTree{value: 5}}
  #   becomes
  #   (3::(5::))
  #
  # - %BinTree{value: 3, left: %BinTree{value: 1}, right: %BinTree{value: 5}}
  #   becomes
  #   (3:(1::):(5::))

  def inspect(%BinTree{value: value, left: left, right: right}, opts) do
    concat([
      "(",
      to_doc(value, opts),
      ":",
      if(left, do: to_doc(left, opts), else: ""),
      ":",
      if(right, do: to_doc(right, opts), else: ""),
      ")"
    ])
  end
end
