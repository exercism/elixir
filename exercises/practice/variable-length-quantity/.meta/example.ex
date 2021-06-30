defmodule VariableLengthQuantity do
  use Bitwise

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) when is_list(integers) do
    integers
    |> Enum.map(&encode/1)
    |> Enum.map(&String.reverse/1)
    |> Enum.join(<<>>)
  end

  def encode(0), do: <<0>>

  def encode(int, leading \\ 0)
  def encode(0, _), do: <<>>

  def encode(int, leading) do
    rest = int >>> 7
    <<leading::1, int::7, encode(rest, 1)::binary>>
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes, _status \\ :complete, acc \\ 0)
  def decode(<<>>, :complete, _), do: {:ok, []}
  def decode(<<>>, :incomplete, _), do: {:error, "incomplete sequence"}

  def decode(<<lead::1, byte::7, bytes::binary>>, _status, acc) do
    acc = (acc <<< 7) + byte

    if lead == 1 do
      decode(bytes, :incomplete, acc)
    else
      with {:ok, result} <- decode(bytes, :complete),
           do: {:ok, [acc | result]}
    end
  end
end
