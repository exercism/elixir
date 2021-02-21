defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> normalize
    |> split
    |> count_words
  end

  defp normalize(string) do
    separating_punctuation = ~r/[,_]/u
    redundant_punctuation = ~r/[^\w\s-_']/u
    apostrophes_around_words = ~r/(?<=\W)'|'(?=[\W])/u
    apostrophes_at_the_beginning = ~r/^'|'(?=[\W])/u
    apostrophes_at_the_end = ~r/(?<=\W)'|'$/u

    string
    |> String.downcase()
    |> String.replace(separating_punctuation, " ")
    |> String.replace(redundant_punctuation, "")
    |> String.replace(apostrophes_around_words, "")
    |> String.replace(apostrophes_at_the_beginning, "")
    |> String.replace(apostrophes_at_the_end, "")
  end

  defp split(string) do
    string |> String.split(~r/[\s]+/, trim: true)
  end

  defp count_words(strings) do
    get_count = fn word, count ->
      Map.update(count, word, 1, &(&1 + 1))
    end

    strings |> Enum.reduce(%{}, get_count)
  end
end
