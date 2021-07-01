defmodule ResistorColor do
  @colors [
    :black,
    :brown,
    :red,
    :orange,
    :yellow,
    :green,
    :blue,
    :violet,
    :grey,
    :white
  ]

  @doc """
  Return a list of all colors
  """
  @spec colors() :: list(atom)
  def colors, do: @colors

  @doc """
  Return the value of a color band
  """
  @spec code(atom) :: integer()
  def code(color), do: Enum.find_index(@colors, &(&1 == color))
end
