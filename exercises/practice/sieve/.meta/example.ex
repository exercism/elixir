defmodule Sieve do
  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(1), do: []

  def primes_to(limit) do
    Enum.to_list(2..limit) |> do_primes([]) |> Enum.reverse()
  end

  defp do_primes([], primes), do: primes
  defp do_primes([nil | sieve], primes), do: do_primes(sieve, primes)

  defp do_primes([prime | _] = sieve, primes) do
    sieve =
      sieve
      |> Enum.chunk_every(prime)
      |> Enum.map(fn [_ | tail] -> [nil | tail] end)
      |> Enum.concat()

    do_primes(sieve, [prime | primes])
  end
end
