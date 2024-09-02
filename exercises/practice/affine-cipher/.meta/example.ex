defmodule AffineCipher do
  @typedoc """
  A type for the encryption key
  """
  @type key() :: %{a: integer, b: integer}

  @alphabet_size 26
  @ignored ~r/[ ,.]/

  @doc """
  Encode an encrypted message using a key
  """
  @spec encode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def(encode(%{a: a, b: b}, message)) do
    if Integer.gcd(a, @alphabet_size) != 1 do
      {:error, "a and m must be coprime."}
    else
      encrypted =
        message
        |> String.downcase()
        |> String.replace(@ignored, "")
        |> to_charlist()
        |> Enum.map(fn
          digit when ?0 <= digit and digit <= ?9 -> digit
          char -> Integer.mod(a * (char - ?a) + b, @alphabet_size) + ?a
        end)
        |> Enum.chunk_every(5)
        |> Enum.map_join(" ", &to_string/1)

      {:ok, encrypted}
    end
  end

  @doc """
  Decode an encrypted message using a key
  """
  @spec decode(key :: key(), encrypted :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def decode(%{a: a, b: b}, encrypted) do
    if Integer.gcd(a, @alphabet_size) != 1 do
      {:error, "a and m must be coprime."}
    else
      mmi = modular_multiplicative_inverse(a, @alphabet_size)

      message =
        encrypted
        |> String.replace(@ignored, "")
        |> to_charlist()
        |> Enum.map(fn
          digit when ?0 <= digit and digit <= ?9 -> digit
          char -> Integer.mod(mmi * (char - ?a - b), @alphabet_size) + ?a
        end)
        |> to_string

      {:ok, message}
    end
  end

  defp modular_multiplicative_inverse(a, m) do
    modular_multiplicative_inverse(a, m, 1, 0)
    |> Integer.mod(m)
  end

  defp modular_multiplicative_inverse(0, r0, _t1, _t0) when r0 > 1, do: raise("Not invertible")
  defp modular_multiplicative_inverse(0, _r0, _t1, t0), do: t0

  defp modular_multiplicative_inverse(r1, r0, t1, t0) do
    q = div(r0, r1)
    modular_multiplicative_inverse(r0 - q * r1, r1, t0 - q * t1, t1)
  end
end
