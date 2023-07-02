defmodule Rectangles do
  @doc """
  Count the number of ASCII rectangles.
  """
  @spec count(input :: String.t()) :: integer
  def count(input) do
    input =
      input
      |> String.split("\n")
      |> Enum.map(&to_charlist/1)

    coord =
      for {row, r} <- Enum.with_index(input),
          {char, c} <- Enum.with_index(row),
          char != ?\s,
          into: %{},
          do: {{r, c}, char}

    corners =
      coord
      |> Enum.filter(fn {_pos, char} -> char == ?+ end)
      |> Enum.map(fn {pos, _char} -> pos end)

    for {r1, c1} <- corners,
        {r2, c2} <- corners,
        r1 < r2 and c1 < c2,
        coord[{r1, c2}] == ?+ and coord[{r2, c1}] == ?+,
        connected?(coord, {r1, c1}, {r2, c2}) do
      :ok
    end
    |> length
  end

  defp connected?(coord, {r1, c1}, {r2, c2}) do
    Enum.all?([
      connected?(coord, r1, r2, column: c1),
      connected?(coord, r1, r2, column: c2),
      connected?(coord, c1, c2, row: r1),
      connected?(coord, c1, c2, row: r2)
    ])
  end

  defp connected?(coord, r1, r2, column: c),
    do: Enum.all?(r1..r2, fn r -> coord[{r, c}] in ~c"+|" end)

  defp connected?(coord, c1, c2, row: r),
    do: Enum.all?(c1..c2, fn c -> coord[{r, c}] in ~c"+-" end)
end
