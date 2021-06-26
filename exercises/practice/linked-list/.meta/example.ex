defmodule LinkedList do
  defstruct front: [], back: []

  @typedoc """
  A linked list is made of two singly linked lists at the front and back
  """
  @type linked_list :: %LinkedList{front: [any], back: [any]}

  @doc """
  Create a new linked list
  """
  @spec new() :: linked_list
  def new, do: %LinkedList{}

  @doc """
  Insert a value at the back
  """
  @spec push(linked :: linked_list, value :: any) :: linked_list
  def push(%LinkedList{back: back} = linked, value), do: %{linked | back: [value | back]}

  @doc """
  Remove a value at the back
  """
  @spec pop(linked :: linked_list) :: {any, linked_list}
  def pop(%LinkedList{back: [value | back]} = linked), do: {value, %{linked | back: back}}
  def pop(%LinkedList{front: front}), do: pop(%LinkedList{back: Enum.reverse(front)})

  @doc """
  Insert a value at the front
  """
  @spec unshift(linked :: linked_list, value :: any) :: linked_list
  def unshift(%LinkedList{front: front} = linked, value), do: %{linked | front: [value | front]}

  @doc """
  Remove a value at the front
  """
  @spec shift(linked :: linked_list) :: {any, linked_list}
  def shift(%LinkedList{front: [value | front]} = linked), do: {value, %{linked | front: front}}
  def shift(%LinkedList{back: back}), do: shift(%LinkedList{front: Enum.reverse(back)})

  @doc """
  Delete an element once, if it exists
  """
  @spec delete(linked :: linked_list, value :: any) :: linked_list
  def delete(%LinkedList{front: front, back: back}, value),
    do: %LinkedList{front: List.delete(front ++ Enum.reverse(back), value)}

  @doc """
  Count the number of elements
  """
  @spec count(linked :: linked_list) :: integer
  def count(%LinkedList{front: front, back: back}), do: length(front) + length(back)
end
