defmodule Words do
  @ascii_punctuation ~r/!|"|\#|\$|%|&|'|\(|\)|\*|\+|,|\.|\/|:|;|<|=|>|\?|@|\[|\\|]|\^|_|`|\{|\||}|~/

  def count(sentence) do
    sentence
    |> String.downcase()
    |> remove_punctuation
    |> to_words
    |> summarize
  end

  defp remove_punctuation(string), do: String.replace(string, @ascii_punctuation, " ")

  defp to_words(sentence), do: List.flatten(String.split(sentence))

  defp summarize(words) do
    Enum.reduce(words, %{}, &add_count/2)
  end

  defp add_count(word, counts) do
    Map.update(counts, word, 1, &(&1 + 1))
  end
end
