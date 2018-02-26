defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a map of characters to frequencies.
  """
  def frequency(texts, workers) do
    groups = Enum.map(0..(workers - 1), &stripe(&1, texts, workers))
    # :rpc.pmap({Frequency, :count_texts}, [], groups)
    Enum.map(groups, &Frequency.count_texts/1)
    |> merge_freqs()
  end

  defp stripe(n, texts, workers) do
    Enum.drop(texts, n) |> Enum.take_every(workers)
  end

  # Needs to be public because of how it's invoked by `:rpc.pmap/4`.
  @doc false
  def count_texts(texts) do
    Enum.map(texts, &count_text/1)
    |> merge_freqs()
  end

  defp count_text(string) do
    String.downcase(string)
    |> String.graphemes()

    # At the time of writing Elixir doesn't yet have a way to determine if a
    # character is a letter. So use a workaround with Regex.
    # \P{L} = anything but a letter
    String.replace(string, ~r/\P{L}+/u, "")
    |> String.downcase()
    |> String.graphemes()
    |> Enum.reduce(%{}, fn c, acc -> Map.update(acc, c, 1, &(&1 + 1)) end)
  end

  defp merge_freqs(map) do
    Enum.reduce(map, %{}, fn d, acc ->
      Map.merge(acc, d, fn _, a, b -> a + b end)
    end)
  end
end
