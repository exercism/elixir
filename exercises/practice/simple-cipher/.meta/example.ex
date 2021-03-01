defmodule SimpleCipher do
  @alphabet "abcdefghijklmnopqrstuvwxyz" |> String.graphemes()
  @alphabet_size @alphabet |> length

  for key_char <- @alphabet do
    shifted_alphabet =
      Stream.cycle(@alphabet)
      |> Stream.drop_while(&(&1 != key_char))
      |> Enum.take(@alphabet_size)

    for {plain, cipher} <- Enum.zip(@alphabet, shifted_alphabet) do
      defp encode_char(unquote(plain), unquote(key_char)), do: unquote(cipher)
      defp decode_char(unquote(cipher), unquote(key_char)), do: unquote(plain)
    end
  end

  defp encode_char(plain, _), do: plain
  defp decode_char(cipher, _), do: cipher

  defp encode_char({plain, key}), do: encode_char(plain, key)
  defp decode_char({cipher, key}), do: decode_char(cipher, key)

  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  def encode(plaintext, key) do
    convert_keystream(plaintext, key, &encode_char/1)
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key) do
    convert_keystream(ciphertext, key, &decode_char/1)
  end

  defp convert_keystream(text, key, converter) do
    keystream = key |> String.graphemes() |> Stream.cycle()

    text
    |> String.graphemes()
    |> Enum.zip(keystream)
    |> Enum.map_join(converter)
  end

  @doc """
  Generate a random key of a given length. It should contain lowercase letters only.
  """
  def generate_key(length) do
    for <<byte <- :crypto.strong_rand_bytes(length)>> do
      delta = rem(byte, ?z - ?a + 1)
      <<?a + delta>>
    end
    |> Enum.join()
  end
end
