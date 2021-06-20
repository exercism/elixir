defmodule AffineCipher do
  @doc """
  Encode an encrypted message using a key
  """
  @spec encode(key :: %{a: integer, b: integer}, message :: String.t()) ::
          {:ok, String.t()} | {:error, String.t()}
  def(encode(%{a: a, b: b}, message)) do
  end

  @doc """
  Decode an encrypted message using a key
  """
  @spec decode(key :: %{a: integer, b: integer}, message :: String.t()) :: String.t()
  def decode(%{a: a, b: b}, encrypted) do
  end
end
