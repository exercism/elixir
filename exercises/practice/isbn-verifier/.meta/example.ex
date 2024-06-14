defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    if Regex.match?(~r/^(\d-?){9}(\d|X)$/, isbn) do
      checksum =
        isbn
        |> String.replace("-", "")
        |> String.graphemes()
        |> Enum.zip(10..1//-1)
        |> Enum.map(&checksum_weighting/1)
        |> Enum.sum()

      rem(checksum, 11) == 0
    else
      false
    end
  end

  defp checksum_weighting({"X", 1}), do: 10

  defp checksum_weighting({digit, weight}) do
    String.to_integer(digit) * weight
  end
end
