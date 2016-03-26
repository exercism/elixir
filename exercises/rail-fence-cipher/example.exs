defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, 1), do: str
  def encode(str, rails) do
    str
    |> String.codepoints
    |> fill_fence(rails)
    |> Enum.join
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, 1), do: str
  def decode(str, rails) do
    0..String.length(str) - 1
    |> Enum.to_list
    |> fill_fence(rails)
    |> extract_original(str)
  end

  defp extract_original(fence, str) do
    0..String.length(str) - 1
    |> Enum.map(fn i ->
      String.at(str, Enum.find_index(fence, &(&1 == i)))
    end)
    |> Enum.join
  end

  defp fill_fence(list_chars, rails) do
    rail_zigzag_indexes = Enum.concat(Enum.to_list(0..rails - 1), Enum.to_list(rails - 2..1))
    create_empty_fence(rails, length(list_chars))
    |> set_chars_to_fence(list_chars, rail_zigzag_indexes)
  end

  defp create_empty_fence(rows, cols) do
    0..rows - 1
    |> Enum.map(fn _ ->
      List.duplicate(nil, cols)
    end)
  end

  defp set_chars_to_fence(fence, chars, pos_in_zigzag) do
    chars
    |> Enum.with_index
    |> Enum.reduce(fence, fn {char, index}, acc ->
         rail_ind = Enum.at(pos_in_zigzag, rem(index, length(pos_in_zigzag)))
         List.update_at(acc, rail_ind, &(List.update_at(&1, index, fn _ -> char end)))
       end)
    |> List.flatten
    |> Enum.filter(&(&1 != nil))
  end
end
