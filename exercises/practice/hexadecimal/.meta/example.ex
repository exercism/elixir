defmodule Hexadecimal do
  @base 16
  @hex_table String.split("0123456789abcdef", "", trim: true)
             |> Enum.with_index()
             |> Enum.into(%{})

  @doc """
    Accept a string representing a hexadecimal value and return the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    if invalid?(hex) do
      0
    else
      hex
      |> String.downcase()
      |> String.reverse()
      |> String.split("", trim: true)
      |> hex_to_int(0, 0)
    end
  end

  defp invalid?(hex) do
    String.match?(hex, ~r/[^0-9a-fA-F]/)
  end

  defp hex_to_int([], acc, _), do: round(acc)

  defp hex_to_int([char | hex], acc, power) do
    acc = acc + Map.get(@hex_table, char) * :math.pow(@base, power)
    hex_to_int(hex, acc, power + 1)
  end
end
