defmodule Atbash do
  @key Enum.zip(?a..?z, ?z..?a) |> Enum.into(%{})

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  def encode(plaintext) do
    plaintext |> normalize |> cipher |> chunk |> Enum.join " "
  end

  defp normalize(input) do
    Regex.replace(~r{\W}, String.downcase(input), "")
  end

  defp cipher(plaintext) do
    plaintext
      |> String.to_char_list
      |> Enum.map(&convert/1)
      |> List.to_string
  end

  defp convert(character) do
    Dict.get(@key, character, character)
  end

  defp chunk(input) do
    Regex.scan(~r(.{1,5}), input) |> List.flatten
  end
end
