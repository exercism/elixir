defmodule FoodChain do
  @animals [
    fly: "I don't know why she swallowed the fly.",
    spider: "It wriggled and jiggled and tickled inside her.",
    bird: "How absurd to swallow a bird!",
    cat: "Imagine that, to swallow a cat!",
    dog: "What a hog, to swallow a dog!",
    goat: "Just opened her throat and swallowed a goat!",
    cow: "I don't know how she swallowed a cow!",
    horse: "She's dead, of course!"
  ]

  @doc """
  Generate consecutive verses of the song 'I Know an Old Lady Who Swallowed a Fly'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop), do: Enum.map_join(start..stop, "\n", &verse/1)

  defp verse(1),
    do: """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

  defp verse(8),
    do: """
    I know an old lady who swallowed a horse.
    She's dead, of course!
    """

  defp verse(number) do
    [{animal, line} | _] =
      animals =
      Enum.take(@animals, number)
      |> Enum.reverse()

    cumulative_lines =
      Enum.zip(animals, tl(animals))
      |> Enum.map_join("\n", fn
        {{:bird, _}, _} ->
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."

        {{a, _}, {b, _}} ->
          "She swallowed the #{a} to catch the #{b}."
      end)

    """
    I know an old lady who swallowed a #{animal}.
    #{line}
    #{cumulative_lines}
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end
end
