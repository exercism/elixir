defmodule BeerSong do
  def verse(1) do
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(2) do
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse(3) do
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse(number) do
    "#{number - 1} bottles of beer on the wall, #{number - 1} bottles of beer.\nTake one down and pass it around, #{number - 2} bottles of beer on the wall.\n"
  end

  def lyrics(range \\ 100..1) do
    range
      |> Enum.map(&verse/1)
      |> Enum.join("\n")
  end
end
