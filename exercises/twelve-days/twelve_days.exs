defmodule TwelveDays do
  @doc """
  Given a `number`, return the word representation of it, or "a" for one.

  1 => "a",
  2 => "two",
  3 => "three",
  etc...
  """
  @spec count(number :: integer) :: String.t()
  def count(number) do
  end

  @doc """
  Given a `number`, return the ordinal representation of it.

  1 => "first",
  2 => "second",
  3 => "third",
  etc...
  """
  @spec ordinal(number :: integer) :: String.t()
  def ordinal(number) do
  end

  @doc """
  Given a `number`, return the gift for that specific day, along with its count.

  1 => "a Partridge in a Pear Tree",
  6 => "six Geese-a-Laying",
  8 => "eight Maids-a-Milking",
  etc...
  """
  @spec gift(number :: integer) :: String.t()
  def gift(number) do
  end

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
  end
end

