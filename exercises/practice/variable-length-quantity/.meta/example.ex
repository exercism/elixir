defmodule VariableLengthQuantity do
  @seven_bits Bitwise.<<<(1, 7) - 1
  @eight_bit Bitwise.<<<(1, 7)

  @doc """
  Encode integers into a series of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: [integer]
  def encode(integers) when is_list(integers) do
    Enum.map(integers, &encode/1)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.concat()
  end

  def encode(0), do: [0]
  def encode(int, leading \\ 0)
  def encode(0, _), do: []

  def encode(int, leading) do
    byte =
      int
      |> Bitwise.band(@seven_bits)
      |> Bitwise.bor(leading)

    rest = Bitwise.>>>(int, 7)
    [byte | encode(rest, @eight_bit)]
  end

  @doc """
  Decode a series of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: [integer]) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes, _status \\ :complete, acc \\ 0)
  def decode([], :complete, _), do: {:ok, []}
  def decode([], :incomplete, _), do: {:error, "incomplete sequence"}

  def decode([byte | bytes], _status, acc) do
    acc =
      Bitwise.<<<(acc, 7)
      |> Bitwise.bor(Bitwise.band(byte, @seven_bits))

    if byte > @seven_bits do
      decode(bytes, :incomplete, acc)
    else
      with {:ok, result} <- decode(bytes, :complete),
           do: {:ok, [acc | result]}
    end
  end
end
