defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @quantifiers %{
    10 => "ten",
    9 => "nine",
    8 => "eight",
    7 => "seven",
    6 => "six",
    5 => "five",
    4 => "four",
    3 => "three",
    2 => "two",
    1 => "one",
    0 => "no"
  }

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(start_bottle, take_down) do
    0..(take_down - 1)
    |> Enum.map(&verse(start_bottle - &1))
    |> Enum.intersperse("")
    |> List.flatten()
    |> Enum.join("\n")
  end

  @spec verse(pos_integer) :: Enum.t()
  defp verse(before_the_fall) do
    after_the_fall = before_the_fall - 1

    [
      main_line(before_the_fall),
      main_line(before_the_fall),
      "And if one green bottle should accidentally fall,",
      "There'll be #{quantifier(after_the_fall)} green #{bottle(after_the_fall)} hanging on the wall."
    ]
  end

  @spec main_line(pos_integer) :: String.t()
  defp main_line(n),
    do: "#{n |> quantifier() |> String.capitalize()} green #{bottle(n)} hanging on the wall,"

  @spec quantifier(non_neg_integer) :: String.t()
  defp quantifier(n), do: Map.get(@quantifiers, n)

  @spec bottle(non_neg_integer) :: String.t()
  defp bottle(1), do: "bottle"
  defp bottle(_), do: "bottles"
end
