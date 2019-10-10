defmodule ResistorColor do
  @moduledoc false

  @colors [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
  ]

  @spec colors() :: list(String.t())
  def colors, do: @colors

  @spec code(String.t()) :: integer()
  def code(color), do: Enum.find_index(@colors, &(&1 == color))
end
