defmodule Allergies do
  import Bitwise

  @allergens [
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
  ]

  def list(flags) do
    Enum.with_index(@allergens)
    |> Enum.filter(&flagged?(flags, &1))
    |> Enum.map(fn {item, _} -> item end)
  end

  def allergic_to?(flags, item) do
    Enum.member?(list(flags), item)
  end

  defp flagged?(flags, {_, index}) do
    (flags &&& 1 <<< index) > 0
  end
end
