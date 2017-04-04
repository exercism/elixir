defmodule TwelveDays do
  @days [
    {"a", "first", "Partridge in a Pear Tree"},
    {"two", "second", "Turtle Doves"},
    {"three", "third", "French Hens"},
    {"four", "fourth", "Calling Birds"},
    {"five", "fifth", "Gold Rings"},
    {"six", "sixth", "Geese-a-Laying"},
    {"seven", "seventh", "Swans-a-Swimming"},
    {"eight", "eighth", "Maids-a-Milking"},
    {"nine", "ninth", "Ladies Dancing"},
    {"ten", "tenth", "Lords-a-Leaping"},
    {"eleven", "eleventh", "Pipers Piping"},
    {"twelve", "twelfth", "Drummers Drumming"}
  ]

  for { { count, ordinal, gift }, number } <- @days |> Enum.with_index(1) do
    def count(unquote(number)), do: unquote(count)
    def ordinal(unquote(number)), do: unquote(ordinal)
    def gift(unquote(number)), do: "#{count(unquote(number))} #{ unquote(gift) }"
  end

  @doc """
  Given a `number`, return the word representation of it, or "a" for one.

  1 => "a",
  2 => "two",
  3 => "three",
  etc...
  """
  @spec count(number :: integer) :: String.t()
  def count(_number), do: nil

  @doc """
  Given a `number`, return the ordinal representation of it.

  1 => "first",
  2 => "second",
  3 => "third",
  etc...
  """
  @spec ordinal(number :: integer) :: String.t()
  def ordinal(_number), do: nil

  @doc """
  Given a `number`, return the gift for that specific day, along with its count.

  1 => "a Partridge in a Pear Tree",
  6 => "six Geese-a-Laying",
  8 => "eight Maids-a-Milking",
  etc...
  """
  @spec gift(number :: integer) :: String.t()
  def gift(_number), do: nil

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{ordinal(number)} day of Christmas my true love gave to me, #{gifts_for_day(number, [])}."
  end

  defp gifts_for_day(1, []), do: gift(1)
  defp gifts_for_day(1, results), do: ["and #{gift(1)}" | results] |> Enum.reverse |> Enum.join(", ")
  defp gifts_for_day(number, results), do: gifts_for_day(number - 1, [gift(number) | results])

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse
    |> Range.new(ending_verse)
    |> Enum.map_join("\n", &verse/1)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing, do: verses(1, 12)
end

