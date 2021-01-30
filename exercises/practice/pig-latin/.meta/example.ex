defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    word
    |> consonant_prefix_and_rest
    |> case do
      ["", _] -> word <> "ay"
      [consonant_prefix, rest] -> rest <> consonant_prefix <> "ay"
      _ -> word
    end
  end

  defp consonant_prefix_and_rest(word) do
    if Regex.match?(~r/^[yx][bcdfghjklmnpqrstvwxy]+/, word) do
      ["", word]
    else
      ~r/^(s?qu|(?:[^aeiou]*))?([aeiou].*)$/
      |> Regex.run(word, capture: :all_but_first)
    end
  end
end
