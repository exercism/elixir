defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """

  @reject_characters ~r/[0-9\s,\p{P}]/u

  @spec frequency([String.t()], pos_integer) :: map
  def frequency([], _workers), do: []

  def frequency(texts, workers) do
    chunk_size = (length(texts) / workers) |> :math.ceil() |> round

    texts
    |> Enum.chunk_every(chunk_size)
    |> Enum.map(&async_frequency/1)
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(%{}, &Map.merge(&1, &2, fn _char, n1, n2 -> n1 + n2 end))
  end

  defp async_frequency(chunk) do
    Task.async(fn ->
      chunk
      |> Enum.join()
      |> String.replace(@reject_characters, "")
      |> String.downcase()
      |> String.graphemes()
      |> frequencies()
    end)
  end

  defp frequencies(items) do
    Enum.reduce(items, %{}, fn item, freq -> Map.update(freq, item, 1, &(&1 + 1)) end)
  end
end
