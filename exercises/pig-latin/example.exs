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
    |> Enum.map_join(" ", &to_pig_latin/1)
  end

  @consonant_sounds ["ch", "sch", "qu", "squ", "thr", "th"]
  @vowel_sounds ["xr", "yt"]
  @consonants "bcdfghjklmnpqrstvwxyz" |> String.graphemes
  @vowels "aeiou" |> String.graphemes

  for sound <- @consonant_sounds do
    defp to_pig_latin(unquote(sound) <> rest), do: "#{rest}#{unquote(sound)}ay"
  end

  for sound <- @vowel_sounds do
    defp to_pig_latin(unquote(sound) <> rest), do: "#{unquote(sound)}#{rest}ay"
  end

  for sound <- @consonants do
    defp to_pig_latin(unquote(sound) <> rest), do: "#{rest}#{unquote(sound)}ay"
  end

  for sound <- @vowels do
    defp to_pig_latin(unquote(sound) <> rest), do: "#{unquote(sound)}#{rest}ay"
  end
end

