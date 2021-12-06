defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  defp die_frequencies(dice) do
    Enum.reduce(dice, %{}, fn die, frequencies ->
      Map.update(frequencies, die, 1, &(&1 + 1))
    end)
  end

  @doc """
  Calculate the score of the list of 5 dice rolls using the given category.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice)

  def score(:ones, dice), do: score_number(1, dice)
  def score(:twos, dice), do: score_number(2, dice)
  def score(:threes, dice), do: score_number(3, dice)
  def score(:fours, dice), do: score_number(4, dice)
  def score(:fives, dice), do: score_number(5, dice)
  def score(:sixes, dice), do: score_number(6, dice)

  def score(:full_house, dice) do
    full_house =
      die_frequencies(dice)
      |> Map.values()
      |> MapSet.new() == MapSet.new([3, 2])

    if full_house do
      Enum.sum(dice)
    else
      0
    end
  end

  def score(:four_of_a_kind, dice) do
    frequencies =
      die_frequencies(dice)
      |> Enum.to_list()
      |> Enum.filter(fn {_, frequency} -> frequency >= 4 end)

    case frequencies do
      [{number, _frequencies}] ->
        number * 4

      _ ->
        0
    end
  end

  def score(:little_straight, dice) do
    if MapSet.new(dice) == MapSet.new([1, 2, 3, 4, 5]) do
      30
    else
      0
    end
  end

  def score(:big_straight, dice) do
    if MapSet.new(dice) == MapSet.new([2, 3, 4, 5, 6]) do
      30
    else
      0
    end
  end

  def score(:choice, dice) do
    Enum.sum(dice)
  end

  def score(:yacht, dice) do
    unique_dice = MapSet.size(MapSet.new(dice))

    case unique_dice do
      1 -> 50
      _ -> 0
    end
  end

  defp score_number(number, dice) when is_integer(number) do
    Enum.count(dice, &(&1 == number)) * number
  end
end
