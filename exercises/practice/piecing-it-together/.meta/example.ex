defmodule JigsawPuzzle do
  @doc """
  Fill in missing jigsaw puzzle details from partial data
  """

  @type format() :: :landscape | :portrait | :square
  @type t() :: %__MODULE__{
          pieces: pos_integer() | nil,
          rows: pos_integer() | nil,
          columns: pos_integer() | nil,
          format: format() | nil,
          aspect_ratio: float() | nil,
          border: pos_integer() | nil,
          inside: pos_integer() | nil
        }

  defstruct [:pieces, :rows, :columns, :format, :aspect_ratio, :border, :inside]

  @spec data(jigsaw_puzzle :: JigsawPuzzle.t()) ::
          {:ok, JigsawPuzzle.t()} | {:error, String.t()}
  def data(%JigsawPuzzle{} = jigsaw_puzzle) do
    jigsaw_puzzle
    |> Map.from_struct()
    |> Enum.filter(fn {_, value} -> value end)
    |> Enum.sort_by(fn {key, _} -> key end)
    |> complete_data()
  end

  defp complete_data(aspect_ratio: aspect_ratio, pieces: pieces) do
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

  defp complete_data(format: :square, rows: rows) do
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

  defp complete_data(format: _, rows: _) do
    {:error, "Insufficient data"}
  end

  defp complete_data(aspect_ratio: 1.0, inside: inside) do
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

  defp complete_data(aspect_ratio: _, inside: _) do
    {:error, "Insufficient data"}
  end

  defp complete_data(aspect_ratio: aspect_ratio, rows: rows) do
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

  defp complete_data(border: border, format: :square, pieces: pieces) do
    complete_data(aspect_ratio: 1.0, inside: pieces - border)
  end

  defp complete_data(border: border, format: format, pieces: pieces) do
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

  defp complete_data(columns: columns, format: format, rows: rows) do
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

  defp complete_data(_) do
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
