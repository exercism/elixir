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
    |> Enum.frequencies()
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
end
