defmodule RotationalCipher do
  @alphabet "abcdefghijklmnopqrstuvwxyz"
  @alphabet_size String.length(@alphabet)

  for shift <- 0..25 do
    plain = String.split(@alphabet, "", trim: true)

    cipher =
      @alphabet
      |> Kernel.<>(@alphabet)
      |> String.split("", trim: true)
      |> Enum.drop(shift)
      |> Enum.take(@alphabet_size)

    for {p, c} <- Enum.zip(plain, cipher) do
      defp translate(unquote(p), unquote(shift)), do: unquote(c)

      defp translate(unquote(p |> String.upcase()), unquote(shift)),
        do: unquote(c |> String.upcase())
    end
  end

  # Non a-zA-Z just returns the original character
  defp translate(plaintext, _), do: plaintext

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  ## Examples

    iex> RotationalCipher.rotate("Attack at dawn", 13)
    "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.split("", trim: true)
    |> Enum.map_join(&translate(&1, shift))
  end
end
