defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    do_keep(list, fun, [])
  end

  defp do_keep([], _, results), do: Enum.reverse(results)

  defp do_keep([head | tail], fun, results) do
    case apply(fun, [head]) do
      true -> do_keep(tail, fun, [head | results])
      _ -> do_keep(tail, fun, results)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    do_discard(list, fun, [])
  end

  defp do_discard([], _, results), do: Enum.reverse(results)

  defp do_discard([head | tail], fun, results) do
    case apply(fun, [head]) do
      true -> do_discard(tail, fun, results)
      _ -> do_discard(tail, fun, [head | results])
    end
  end
end
