defmodule VariableLengthQuantity do
  import Bitwise

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) when is_list(integers) do
    integers
    |> Enum.map(&do_encode/1)
    |> Enum.map(&reverse/1)
    |> Enum.join(<<>>)
  end

  defp do_encode(0), do: <<0>>

  defp do_encode(int, leading \\ 0)
  defp do_encode(0, _), do: <<>>

  defp do_encode(int, leading) do
    rest = int >>> 7
    <<leading::1, int::7, do_encode(rest, 1)::binary>>
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes), do: do_decode(bytes)
  defp do_decode(bytes, _status \\ :complete, acc \\ 0)
  defp do_decode(<<>>, :complete, _), do: {:ok, []}
  defp do_decode(<<>>, :incomplete, _), do: {:error, "incomplete sequence"}

  defp do_decode(<<lead::1, byte::7, bytes::binary>>, _status, acc) do
    acc = (acc <<< 7) + byte

    if lead == 1 do
      do_decode(bytes, :incomplete, acc)
    else
      with {:ok, result} <- do_decode(bytes, :complete) do
        {:ok, [acc | result]}
      end
    end
  end

  defp reverse(bitstring) do
    list = for <<x <- bitstring>>, into: [], do: x
    for bit <- Enum.reverse(list), into: <<>>, do: <<bit>>
  end
end
