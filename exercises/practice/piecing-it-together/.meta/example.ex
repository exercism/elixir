defmodule PiecingItTogether do
  @doc """
  TODO: add function description and replace types in @spec
  """

  defmodule JigsawPuzzle do
    @type format() :: :landscape | :portrait | :square
    @type t() :: %__MODULE__{
            pieces: pos_integer(),
            rows: pos_integer(),
            columns: pos_integer(),
            format: format(),
            aspect_ratio: float(),
            border: pos_integer(),
            inside: pos_integer()
          }

    defstruct [:pieces, :rows, :columns, :format, :aspect_ratio, :border, :inside]
  end

  @spec jigsaw_data(jigsaw_puzzle :: JigsawPuzzle.t()) ::
          {:ok, JigsawPuzzle.t()} | {:error, String.t()}
  def jigsaw_data(%JigsawPuzzle{} = jigsaw_puzzle) do
    jigsaw_puzzle
    |> Map.from_struct()
    |> Enum.filter(fn {_, value} -> value end)
    |> Enum.sort_by(fn {key, _} -> key end)
    |> complete_jigsaw_data()
  end

  defp complete_jigsaw_data(aspect_ratio: aspect_ratio, pieces: pieces) do
    columns = round(:math.sqrt(aspect_ratio * pieces))
    rows = Integer.floor_div(pieces, columns)
    border = 2 * (rows + columns) - 4
    inside = pieces - border

    {:ok,
     %JigsawPuzzle{
       pieces: pieces,
       rows: rows,
       columns: columns,
       format: aspect_ratio_to_format(aspect_ratio),
       aspect_ratio: aspect_ratio,
       border: border,
       inside: inside
     }}
  end

  defp complete_jigsaw_data(format: :square, rows: rows) do
    columns = rows
    pieces = rows * columns
    border = 2 * (rows + columns) - 4
    inside = pieces - border

    {:ok,
     %JigsawPuzzle{
       pieces: pieces,
       rows: rows,
       columns: columns,
       format: :square,
       aspect_ratio: 1.0,
       border: border,
       inside: inside
     }}
  end

  defp complete_jigsaw_data(format: _, rows: _) do
    {:error, "Insufficient data"}
  end

  defp complete_jigsaw_data(aspect_ratio: 1.0, inside: inside) do
    columns = 2 + round(:math.sqrt(inside))
    rows = columns
    pieces = rows * columns
    border = pieces - inside

    {:ok,
     %JigsawPuzzle{
       pieces: pieces,
       rows: rows,
       columns: columns,
       format: :square,
       aspect_ratio: 1.0,
       border: border,
       inside: inside
     }}
  end

  defp complete_jigsaw_data(aspect_ratio: _, inside: _) do
    {:error, "Insufficient data"}
  end

  defp complete_jigsaw_data(aspect_ratio: aspect_ratio, rows: rows) do
    columns = round(rows * aspect_ratio)
    pieces = rows * columns
    border = 2 * (rows + columns) - 4
    inside = pieces - border

    {:ok,
     %JigsawPuzzle{
       pieces: pieces,
       rows: rows,
       columns: columns,
       format: aspect_ratio_to_format(aspect_ratio),
       aspect_ratio: aspect_ratio,
       border: border,
       inside: inside
     }}
  end

  defp complete_jigsaw_data(border: border, format: :square, pieces: pieces) do
    complete_jigsaw_data(aspect_ratio: 1.0, inside: pieces - border)
  end

  defp complete_jigsaw_data(border: border, format: format, pieces: pieces) do
    center = 1 + border / 4
    diff = :math.sqrt(center ** 2 - pieces)

    {rows, columns} =
      case format do
        :landscape -> {round(center - diff), round(center + diff)}
        :portrait -> {round(center + diff), round(center - diff)}
      end

    aspect_ratio = columns / rows
    inside = pieces - border

    {:ok,
     %JigsawPuzzle{
       pieces: pieces,
       rows: rows,
       columns: columns,
       format: format,
       aspect_ratio: aspect_ratio,
       border: border,
       inside: inside
     }}
  end

  defp complete_jigsaw_data(columns: columns, format: format, rows: rows) do
    aspect_ratio = columns / rows

    if format == aspect_ratio_to_format(aspect_ratio) do
      pieces = rows * columns
      border = 2 * (rows + columns) - 4
      inside = rows * columns - border

      {:ok,
       %JigsawPuzzle{
         pieces: pieces,
         rows: rows,
         columns: columns,
         format: format,
         aspect_ratio: aspect_ratio,
         border: border,
         inside: inside
       }}
    else
      {:error, "Contradictory data"}
    end
  end

  defp complete_jigsaw_data(_) do
    {:error, "Insufficient data"}
  end

  defp aspect_ratio_to_format(aspect_ratio) do
    case aspect_ratio do
      aspect_ratio when aspect_ratio < 1 -> :portrait
      aspect_ratio when aspect_ratio > 1 -> :landscape
      _ -> :square
    end
  end
end
