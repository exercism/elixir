defmodule VariableLengthQuantity do
  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: <<_::8>>
  def encode(integers) do
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: <<_::8>>) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) do
  end
end
