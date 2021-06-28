defmodule SgfParsing do
  defmodule Sgf do
    defstruct properties: %{}, children: []
  end

  @type sgf :: %Sgf{properties: map, children: [sgf]}

  @doc """
  Parse a string into a Smart Game Format tree
  """
  @spec parse(encoded :: String.t()) :: {:ok, sgf} | {:error, String.t()}
  def parse(encoded) do
  end
end
