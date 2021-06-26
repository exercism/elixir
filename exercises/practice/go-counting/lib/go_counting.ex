defmodule GoCounting do
  @type position :: {integer, integer}
  @type owner :: %{owner: atom, territory: [position]}
  @type territories :: %{white: [position], black: [position], none: [position]}

  @doc """
  Return the owner and territory around a position
  """
  @spec territory(board :: String.t(), position :: position) ::
          {:ok, owner} | {:error, String.t()}
  def territory(board, {x, y} = pos) do
  end

  @doc """
  Return all white, black and neutral territories
  """
  @spec territories(board :: String.t()) :: territories
  def territories(board) do
  end
end
