defmodule Atbash do
  @key Enum.zip(?a..?z, ?z..?a//-1) |> Enum.into(%{})

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext |> normalize |> transpose |> chunk |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher |> normalize |> transpose
  end

  defp normalize(input) do
    Regex.replace(~r{\W}, String.downcase(input), "")
  end

  defp transpose(text) do
    text
    |> String.to_charlist()
    |> Enum.map(&convert/1)
    |> List.to_string()
  end

  defp convert(character) do
    Map.get(@key, character, character)
  end

  defp chunk(input) do
    Regex.scan(~r(.{1,5}), input) |> List.flatten()
  end
end
