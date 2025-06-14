defmodule BafflingBirthdays do
  @moduledoc """
  Estimate the probability of shared birthdays in a group of people.
  """

  @spec shared_birthday?(birthdates :: [Date.t()]) :: boolean()
  def shared_birthday?(birthdates) do
    result =
      Enum.reduce_while(birthdates, MapSet.new(), fn date, birthdays ->
        birthday = {date.month, date.day}

        if MapSet.member?(birthdays, birthday) do
          {:halt, :found_a_shared_birthday}
        else
          {:cont, MapSet.put(birthdays, birthday)}
        end
      end)

    result == :found_a_shared_birthday
  end

  @spec random_birthdates(group_size :: integer()) :: [Date.t()]
  def random_birthdates(group_size) do
    for _ <- 1..group_size do
      year = generate_non_leap_year_january_first(0, 3000)
      days_to_add = Enum.random(0..364)
      Date.add(year, days_to_add)
    end
  end

  defp generate_non_leap_year_january_first(min, max) do
    year = Enum.random(min..max)
    january_first = Date.new!(year, 1, 1)

    if Date.leap_year?(january_first) do
      Date.add(january_first, 366)
    else
      january_first
    end
  end

  @spec estimated_probability_of_shared_birthday(group_size :: integer()) :: float()
  def estimated_probability_of_shared_birthday(group_size) do
    sample_size = 1000

    shared_birthdays_count =
      for _ <- 1..sample_size,
          group_size |> random_birthdates() |> shared_birthday?(),
          reduce: 0 do
        count -> count + 1
      end

    100 * shared_birthdays_count / sample_size
  end
end
