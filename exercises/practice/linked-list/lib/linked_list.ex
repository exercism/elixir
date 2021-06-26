defmodule LinkedList do
  @type linked_list :: nil

  @doc """
  Create a new linked list
  """
  @spec new() :: linked_list
  def new do
  end

  @doc """
  Insert a value at the back
  """
  @spec push(linked :: linked_list, value :: any) :: linked_list
  def push(linked, value) do
  end

  @doc """
  Remove a value at the back
  """
  @spec pop(linked :: linked_list) :: {any, linked_list}
  def pop(linked) do
  end

  @doc """
  Insert a value at the front
  """
  @spec unshift(linked :: linked_list, value :: any) :: linked_list
  def unshift(linked, value) do
  end

  @doc """
  Remove a value at the front
  """
  @spec shift(linked :: linked_list) :: {any, linked_list}
  def shift(linked) do
  end

  @doc """
  Delete an element once, if it exists
  """
  @spec delete(linked :: linked_list, value :: any) :: linked_list
  def delete(linked, value) do
  end

  @doc """
  Count the number of elements
  """
  @spec count(linked :: linked_list) :: integer
  def count(linked) do
  end
end
