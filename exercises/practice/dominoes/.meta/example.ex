defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino]) :: boolean
  def chain?([]), do: true
  def chain?([{a, a}]), do: true
  def chain?([{_a, _b}]), do: false
  def chain?(dominoes), do: [] !== chains(dominoes)

  defp chains([first | rest]) do
    for combi <- permutations(rest),
        {:ok, result} <- chain(combi, [], first),
        do: result
  end

  defp chain([], [{a, _} | _] = acc, {_, a} = last), do: [{:ok, acc ++ [last]}]
  defp chain([], _acc, _last), do: [{:error, :ends_not_same}]

  defp chain([{b, c} = this | rest], acc, {_, b} = next) when b != c do
    chain(rest, acc ++ [next], this)
  end

  defp chain([{c, b} | rest], acc, {_, b} = next) when b != c do
    chain(rest, acc ++ [next], {b, c})
  end

  defp chain([{b, b} = this | rest], acc, {_, b} = next) do
    chain(rest, acc ++ [next], this)
  end

  defp chain(_a, _b, _c), do: [{:error, :no_followup}]

  defp permutations([]), do: [[]]

  defp permutations(list) do
    for h <- list,
        t <- permutations(list -- [h]),
        do: [h | t]
  end
end
