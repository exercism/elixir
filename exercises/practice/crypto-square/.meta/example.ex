defmodule CryptoSquare do
  @doc """
  Encode string square methods

  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(str), do: do_encode(normalize_string(str))

  defp do_encode(""), do: ""

  defp do_encode(str) do
    normalized = normalize_string(str)
    section_length = normalized |> byte_size |> :math.sqrt() |> Float.ceil() |> trunc

    normalized
    |> String.graphemes()
    |> Enum.chunk_every(section_length, section_length, List.duplicate(" ", section_length))
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
