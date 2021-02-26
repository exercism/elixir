defmodule PigLatin do
  @vowels "aeiou"

  @prefixes_not_to_be_moved [
    ~r/^[#{@vowels}]+/,
    ~r/^x[^#{@vowels}]/,
    ~r/^y[^#{@vowels}]/
  ]

  @prefixes_to_be_moved [
    ~r/^(squ)/,
    ~r/^(qu)/,
    ~r/^(thr)/,
    ~r/^(th)/,
    ~r/^(sch)/,
    ~r/^(ch)/,
    ~r/^([^#{@vowels}]+)[#{@vowels}y]/
  ]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    word =
      if prefix_should_be_moved?(word) do
        prefix = find_prefix_to_be_moved(word)
        move_prefix_to_the_end(word, prefix)
      else
        word
      end

    word <> "ay"
  end

  defp prefix_should_be_moved?(word) do
    !Enum.any?(@prefixes_not_to_be_moved, &Regex.match?(&1, word))
  end

  defp find_prefix_to_be_moved(word) do
    Enum.find_value(@prefixes_to_be_moved, fn regex ->
      case Regex.run(regex, word) do
        nil -> nil
        [_, match] -> match
      end
    end)
  end

  defp move_prefix_to_the_end(string, prefix) do
    String.slice(string, String.length(prefix)..-1) <> prefix
  end
end
