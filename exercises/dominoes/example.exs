defmodule Dominoes do

  @doc """
  chain?/1 takes a list of integer and returns boolean indicating if chain is possible
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec chain?(dominoes :: list) :: boolean
  def chain?([]), do: true
  def chain?([[a, a]]), do: true
  def chain?([[_a, _b]]), do: false
  def chain?(dominoes), do: [] !== chains(dominoes)

  def chains([first | rest]) do
    for combi <- permutations(rest), {:ok, result} <- chain(combi, [], first), do: result
  end

  defp chain([], [a | _] = acc, [_, a] = last), do: [{:ok, acc ++ last}]
  defp chain([], _acc, _last), do: [{:error, :ends_not_same}]

  defp chain([[b, c] = this | rest], acc, [_, b] = next) when b != c do
    chain(rest, acc ++ next, this)
  end

  defp chain([[c, b] | rest], acc, [_, b] = next) when b != c  do
    chain(rest, acc ++ next, [b, c])
  end

  defp chain([[b, b] = this | rest], acc, [_, b] = next)  do
    chain(rest, acc ++ next, this)
  end

  defp chain(_a, _b, _c), do: [{:error, :no_followup}]

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h | t]
  end
end
