defmodule PiecingItTogether do
  @doc """
  Fill in missing jigsaw puzzle details from partial data
  """

  defmodule JigsawPuzzle do
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
  end

  @spec jigsaw_data(jigsaw_puzzle :: JigsawPuzzle.t()) ::
          {:ok, JigsawPuzzle.t()} | {:error, String.t()}
  def jigsaw_data(jigsaw_puzzle) do
  end
end
