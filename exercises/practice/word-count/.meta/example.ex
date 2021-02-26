defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> normalize()
    |> split
    |> frequencies()
  end

  defp normalize(string) do
    string
    |> String.downcase()
    |> String.replace("_", " ", global: true)
  end

  defp split(string) do
    ~r/\b[\w'-]+\b/u
    |> Regex.scan(string)
    |> List.flatten()
  end

  defp frequencies(strings) do
    # Enum.frequencies is only available from Elixir 1.10
    strings
    |> Enum.reduce(%{}, fn word, count ->
      Map.update(count, word, 1, &(&1 + 1))
    end)
  end
end
