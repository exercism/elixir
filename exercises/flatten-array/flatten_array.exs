defmodule Flattener do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> Flattener.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> Flattener.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do

  end
end
