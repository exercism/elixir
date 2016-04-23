defmodule BinarySearch do
  @doc """
    Searches for a key in the list using the binary search algorithm.
    It returns :not_found if the key is not in the list.
    Otherwise returns the tuple {:ok, index}.

    ## Examples

      iex> BinarySearch.search([], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 5)
      {:ok, 2}

  """

  @spec search(Enumerable.t, integer) :: {:ok, integer} | :not_found
  def search([], _key), do: :not_found
  def search(list, key), do: _search(list, key, 0, length(list) - 1)

  defp _search(list, _key, low, high) when high < low, do: :not_found
  defp _search(list, key, low, high) do
    middle = div(low + high, 2)
    middle_value = Enum.at(list, middle)

    cond do
      key < middle_value -> _search(list, key, low, middle - 1)
      key > middle_value -> _search(list, key, middle + 1, high)
      true               -> {:ok, middle}
    end
  end
end
