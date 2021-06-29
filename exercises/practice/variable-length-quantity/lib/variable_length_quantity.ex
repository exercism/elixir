defmodule VariableLengthQuantity do
  @doc """
  Encode integers into a series of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: [integer]
  def encode(integers) do
  end

  @doc """
  Decode a series of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: [integer]) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) do
  end
end
