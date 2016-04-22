defmodule Accumulate do
  @doc """
    Given a function and a list, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate(fn(x) -> x * 2 end, [])
      []

      iex> Accumulate.accumulate(fn(x) -> x * 2 end, [1, 2, 3])
      [2, 4, 6]

  """

  @spec accumulate(Enumerable.t, (any -> any)) :: list
  def accumulate(fun, list) do
  end
end
