defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, 1), do: str
  def encode(str, rails) do
    str
    |> String.codepoints
    |> fence(rails)
    |> Enum.join
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, 1), do: str
  def decode(str, rails) do
    range = 0..String.length(str) - 1
    pos = range |> Enum.to_list |> fence(rails)
    range
    |> Enum.reduce([], fn i, acc -> 
         [String.at(str, Enum.find_index(pos, &(&1 == i))) | acc]
       end)
    |> Enum.reverse
    |> Enum.join
  end

  defp fence(list_chars, rails) do
    rail_indexes = Enum.concat(Enum.to_list(0..rails - 1), Enum.to_list(rails - 2..1))
    fence = 0..rails - 1
      |> Enum.reduce([], fn _, acc -> 
           [List.duplicate(nil, length(list_chars)) | acc]
         end)
      |> Enum.reverse

    list_chars
    |> Enum.with_index
    |> Enum.reduce(fence, fn {v, i}, acc ->
         num_rail = Enum.at(rail_indexes, rem(i, length(rail_indexes)))
         List.update_at(acc, num_rail, &(List.update_at(&1, i, fn _ -> v end)))
       end) 
    |> List.flatten
    |> Enum.filter(&(&1 != nil))
  end
end
