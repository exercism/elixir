defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten(list, [])
  end

  defp do_flatten([head | tail], flattened) when is_list(head) do
    do_flatten(head, do_flatten(tail, flattened))
  end

  defp do_flatten([nil | tail], flattened) do
    do_flatten(tail, flattened)
  end

  defp do_flatten([head | tail], flattened) do
    [head | do_flatten(tail, flattened)]
  end

  defp do_flatten([], flattened) do
    flattened
  end
end
