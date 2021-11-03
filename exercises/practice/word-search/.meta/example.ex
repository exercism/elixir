defmodule WordSearch do
  defmodule Location do
    defstruct [:from, :to]

    @type t :: %Location{
            from: %{row: integer, column: integer},
            to: %{row: integer, column: integer}
          }
  end

  @doc """
  Find the start and end positions of words in a grid of letters.
  Row and column positions are 1 indexed.
  """
  @spec search(grid :: String.t(), words :: [String.t()]) :: %{String.t() => nil | Location.t()}
  def search(grid, words) do
    grid =
      String.split(grid, "\n")
      |> Enum.map(&to_charlist/1)

    {coord, starting_points} =
      for {row, r} <- Enum.with_index(grid, 1),
          {char, c} <- Enum.with_index(row, 1) do
        {char, %{row: r, column: c}}
      end
      |> Enum.reduce({%{}, %{}}, fn {char, pos}, {coord, starting_points} ->
        {Map.put(coord, pos, char), Map.update(starting_points, char, [pos], &[pos | &1])}
      end)

    Map.new(words, fn <<start, _::binary>> = word ->
      {word, search(word, starting_points[start], coord)}
    end)
  end

  defp search(_word, nil, _coord), do: nil

  defp search(word, starting_points, coord) do
    word_length = String.length(word)
    word = to_charlist(word)

    for point <- starting_points,
        path <- make_paths(point, word_length - 1),
        word == Enum.map(path, &coord[&1]) do
      %Location{from: List.first(path), to: List.last(path)}
    end
    |> Enum.reduce(nil, &||/2)
  end

  defp make_paths(%{row: r, column: c}, delta) do
    [
      for(i <- 0..delta, do: %{row: r + i, column: c}),
      for(i <- 0..delta, do: %{row: r - i, column: c}),
      for(i <- 0..delta, do: %{row: r, column: c + i}),
      for(i <- 0..delta, do: %{row: r, column: c - i}),
      for(i <- 0..delta, do: %{row: r + i, column: c + i}),
      for(i <- 0..delta, do: %{row: r + i, column: c - i}),
      for(i <- 0..delta, do: %{row: r - i, column: c + i}),
      for(i <- 0..delta, do: %{row: r - i, column: c - i})
    ]
  end
end
