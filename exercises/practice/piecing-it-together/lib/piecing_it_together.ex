defmodule PiecingItTogether do
  @doc """
  Fill in missing jigsaw puzzle details from partial data
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
  def jigsaw_data(jigsaw_puzzle) do
  end
end
