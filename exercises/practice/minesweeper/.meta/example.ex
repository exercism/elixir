defmodule Minesweeper do
  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t()]) :: [String.t()]
  def annotate([]), do: []

  def annotate(board) do
    h = length(board)
    # Only 7-bit ASCII in the board, so this is safe
    w = String.length(hd(board))

    annotations =
      Enum.reduce(Stream.with_index(board), %{}, fn {line, y}, acc ->
        Enum.reduce(Stream.with_index(String.to_charlist(line)), acc, fn
          {?*, x}, acc -> add_adjacents(acc, {x, y}, {w, h})
          _, acc -> acc
        end)
      end)

    Enum.map(Stream.with_index(board), fn {line, y} ->
      Enum.map(Stream.with_index(String.to_charlist(line)), fn
        # Don't replace mines
        {?*, _} ->
          ?*

        {_, x} ->
          case annotations[{x, y}] do
            nil -> ?\s
            n -> ?0 + n
          end
      end)
      |> to_string
    end)
  end

  @adjacent_vecs for x <- [-1, 0, 1],
                     y <- [-1, 0, 1],
                     x != 0 or y != 0,
                     do: {x, y}

  defp add_adjacents(d, c, bounds) do
    Enum.reduce(@adjacent_vecs, d, fn v, acc ->
      c1 = add_vec(c, v)

      if valid?(c1, bounds) do
        Map.update(acc, c1, 1, &(&1 + 1))
      else
        acc
      end
    end)
  end

  defp add_vec({cx, cy}, {vx, vy}), do: {cx + vx, cy + vy}

  defp valid?({cx, cy}, {w, h}), do: cx >= 0 and cx < w and cy >= 0 and cy < h
end
