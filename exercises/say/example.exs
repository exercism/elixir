defmodule Say do
  @moduledoc """
  This example solution takes an integer and breaks it into chunks of 3 and
  translates those chunks the same. The larger denominations (e.g. 'thousand')
  are added if there are multiple chunks to translate.  Here are a few examples:

  - `Say.in_english(23)` creates the chunk of `[0, 2, 3]` and invokes
    `translate_chunk` on that to produce "twenty-three".
  - `Say.in_english(1_234)` creates the chunks of `[0, 0, 1]` and `[2, 3, 4]`,
     which `translate_chunk` will translate to "one" and
     "two hundred thirty-four" and `translate_chunks` will combine them for
     `one thousand two hundred thirty-four`.

  Padding the chunks with leading zeroes gives us nice and even chunks of 3
  digits to translate.
  """

  @small_numbers ~w(
    one two three four five six seven eight nine ten
    eleven twelve thirteen fourteen fifteen sixteen
    seventeen eighteen nineteen
  )

  @decades ~w(
    twenty thirty forty fifty sixty seventy eighty ninety
  )

  @separators ~w(thousand million billion)

  @doc """
  Translate a positive integer into English.
  """

  @spec in_english(number) :: {atom, String.t()}
  def in_english(number) when number < 0 or number >= 1_000_000_000_000 do
    {:error, "number is out of range"}
  end

  def in_english(0), do: {:ok, "zero"}

  def in_english(number) do
    result =
      Integer.digits(number)
      |> padded_chunk(3, 0)
      |> translate_chunks
      |> clean_join(" ")

    {:ok, result}
  end

  @spec translate_chunks(list) :: [String.t()]
  defp translate_chunks(chunks) do
    translate_chunks(chunks, Enum.count(chunks))
  end

  @spec translate_chunks(list, number) :: [String.t()]
  defp translate_chunks([chunk], 1), do: [translate_chunk(chunk)]

  defp translate_chunks([[0, 0, 0] | remaining], n) do
    translate_chunks(remaining, n - 1)
  end

  defp translate_chunks([chunk | remaining], n) do
    chunk_in_english =
      [
        translate_chunk(chunk),
        Enum.at(@separators, n - 2)
      ]
      |> clean_join(" ")

    [chunk_in_english | translate_chunks(remaining, n - 1)]
  end

  @spec translate_chunk([number]) :: String.t()
  defp translate_chunk([0, 0, 0]), do: ""
  defp translate_chunk([0, 0, ones]), do: ones_in_english(ones)

  defp translate_chunk([0, 1, ones]) do
    ones_in_english(ones + 10)
  end

  defp translate_chunk([0, tens, 0]), do: tens_in_english(tens)

  defp translate_chunk([0, tens, ones]) do
    [
      tens_in_english(tens),
      ones_in_english(ones)
    ]
    |> clean_join("-")
  end

  defp translate_chunk([hundreds, 0, 0]) do
    "#{ones_in_english(hundreds)} hundred"
  end

  defp translate_chunk([hundreds, tens, ones]) do
    [
      translate_chunk([hundreds, 0, 0]),
      translate_chunk([0, tens, ones])
    ]
    |> clean_join(" ")
  end

  @spec ones_in_english(number) :: String.t()
  defp ones_in_english(index), do: Enum.at(@small_numbers, index - 1)

  @spec tens_in_english(number) :: String.t()
  defp tens_in_english(index), do: Enum.at(@decades, index - 2)

  @spec clean_join([any], String.t()) :: String.t()
  defp clean_join(collection, separator) do
    collection
    |> reject_blank
    |> Enum.join(separator)
  end

  @spec reject_blank([any]) :: [any]
  defp reject_blank(col) do
    col
    |> Enum.reject(&(&1 == nil || &1 == ""))
  end

  @spec padded_chunk([any], number, any) :: [any]
  defp padded_chunk(list, chunk_size, pad) do
    pad_size = pad_size(chunk_size, rem(Enum.count(list), chunk_size))

    pad(list, pad, pad_size)
    |> Enum.chunk_every(chunk_size)
  end

  @spec pad_size(number, number) :: number
  defp pad_size(_, 0), do: 0
  defp pad_size(total, rem), do: total - rem

  @spec pad([any], any, number) :: [any]
  defp pad(list, _, 0), do: list

  defp pad(list, pad, count) do
    [pad] ++ pad(list, pad, count - 1)
  end
end
