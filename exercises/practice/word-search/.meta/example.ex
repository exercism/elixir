defmodule WordSearch do
  defmodule Location do
    defstruct [:from, :to]
    @type t :: %Location{from: {integer, integer}, to: {integer, integer}}
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
          {char, c} <- Enum.with_index(row, 1),
          reduce: {%{}, %{}} do
        {coord, starting_points} ->
          {Map.put(coord, {r, c}, char),
           Map.update(starting_points, char, [{r, c}], &[{r, c} | &1])}
      end

    Map.new(words, fn <<start, _::binary>> = word ->
      {word, search(word, starting_points[start], coord)}
    end)
  end

  def search(_word, nil, _coord), do: nil

  def search(word, starting_points, coord) do
    word_length = String.length(word)
    word = to_charlist(word)

    for point <- starting_points,
        path <- make_paths(point, word_length - 1),
        reduce: nil do
      location ->
        location ||
          if word == Enum.map(path, &coord[&1]),
            do: %Location{from: List.first(path), to: List.last(path)}
    end
  end

  def make_paths({r, c}, delta) do
    [
      for(i <- 0..delta, do: {r + i, c}),
      for(i <- 0..delta, do: {r - i, c}),
      for(i <- 0..delta, do: {r, c + i}),
      for(i <- 0..delta, do: {r, c - i}),
      for(i <- 0..delta, do: {r + i, c + i}),
      for(i <- 0..delta, do: {r + i, c - i}),
      for(i <- 0..delta, do: {r - i, c + i}),
      for(i <- 0..delta, do: {r - i, c - i})
    ]
  end
end
