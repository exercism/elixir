defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(str) do
    normalized = normalize_string(str)
    section_length = normalized |> byte_size |> :math.sqrt() |> Float.ceil() |> trunc

    normalized
    |> String.graphemes()
    |> Enum.chunk(section_length, section_length, List.duplicate("", section_length))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.join(" ")
  end

  defp normalize_string(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
  end
end
