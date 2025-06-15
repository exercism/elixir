defmodule BafflingBirthdaysTest do
  use ExUnit.Case

  describe "shared birthday" do
    # @tag :pending
    test "one birthdate" do
      birthdates = [~D[2000-01-01]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == false
    end

    @tag :pending
    test "two birthdates with same year, month, and day" do
      birthdates = [~D[2000-01-01], ~D[2000-01-01]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == true
    end

    @tag :pending
    test "two birthdates with same year and month, but different day" do
      birthdates = [~D[2012-05-09], ~D[2012-05-17]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == false
    end

    @tag :pending
    test "two birthdates with same month and day, but different year" do
      birthdates = [~D[1999-10-23], ~D[1988-10-23]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == true
    end

    @tag :pending
    test "two birthdates with same year, but different month and day" do
      birthdates = [~D[2007-12-19], ~D[2007-04-27]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == false
    end

    @tag :pending
    test "two birthdates with different year, month, and day" do
      birthdates = [~D[1997-08-04], ~D[1963-11-23]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == false
    end

    @tag :pending
    test "multiple birthdates without shared birthday" do
      birthdates = [~D[1966-07-29], ~D[1977-02-12], ~D[2001-12-25], ~D[1980-11-10]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == false
    end

    @tag :pending
    test "multiple birthdates with one shared birthday" do
      birthdates = [~D[1966-07-29], ~D[1977-02-12], ~D[2001-07-29], ~D[1980-11-10]]
      assert BafflingBirthdays.shared_birthday?(birthdates) == true
    end

    @tag :pending
    test "multiple birthdates with more than one shared birthday" do
      birthdates = [
        ~D[1966-07-29],
        ~D[1977-02-12],
        ~D[2001-12-25],
        ~D[1980-07-29],
        ~D[2019-02-12]
      ]

      assert BafflingBirthdays.shared_birthday?(birthdates) == true
    end
  end

  describe "random birthdates" do
    @tag :pending
    test "generate requested number of birthdates" do
      group_size = 3000
      dates = BafflingBirthdays.random_birthdates(group_size)
      assert length(dates) == group_size
    end

    @tag :pending
    test "years are not leap years" do
      group_size = 3000
      dates = BafflingBirthdays.random_birthdates(group_size)
      refute Enum.any?(dates, &Date.leap_year?/1)
    end

    @tag :pending
    test "months are random" do
      group_size = 3000
      dates = BafflingBirthdays.random_birthdates(group_size)

      month_frequencies =
        dates
        |> Enum.map(fn date -> date.month end)
        |> Enum.frequencies()

      number_of_months = 12
      assert map_size(month_frequencies) == number_of_months

      expected_count = group_size / number_of_months

      expected_count_standard_deviation =
        :math.sqrt(group_size * (1 / number_of_months) * (1 - 1 / number_of_months))

      counts_outside_95_percent_confidence_interval =
        month_frequencies
        |> Enum.filter(fn {_, count} ->
          abs(count - expected_count) > 1.96 * expected_count_standard_deviation
        end)
        |> length()

      # given a correct solution, this is expected to fail once in 100_000 runs
      assert counts_outside_95_percent_confidence_interval <= 6
    end

    @tag :pending
    test "days are random" do
      group_size = 30000
      dates = BafflingBirthdays.random_birthdates(group_size)

      day_frequencies =
        dates
        |> Enum.map(fn date -> date.day end)
        |> Enum.frequencies()

      number_of_days = 31
      assert map_size(day_frequencies) == number_of_days

      expected_count = fn
        day when day <= 28 -> group_size * 12 / 365
        day when day <= 30 -> group_size * 11 / 365
        day when day == 31 -> group_size * 7 / 365
      end

      expected_count_standard_deviation = fn
        day when day <= 28 -> :math.sqrt(group_size * 12 / 365 * (1 - 12 / 365))
        day when day <= 30 -> :math.sqrt(group_size * 11 / 365 * (1 - 11 / 365))
        day when day == 31 -> :math.sqrt(group_size * 7 / 365 * (1 - 7 / 365))
      end

      counts_outside_95_percent_confidence_interval =
        day_frequencies
        |> Enum.filter(fn {day, count} ->
          abs(count - expected_count.(day)) > 1.96 * expected_count_standard_deviation.(day)
        end)
        |> length()

      # given a correct solution, this is expected to fail once in 100_000 runs
      assert counts_outside_95_percent_confidence_interval <= 9
    end
  end

  describe "estimated probability of at least one shared birthday" do
    @tag :pending
    test "for one person" do
      group_size = 1
      assert BafflingBirthdays.estimated_probability_of_shared_birthday(group_size) == 0.0
    end

    @tag :pending
    test "among ten people" do
      group_size = 10
      expected = 11.694818

      # for a sample size of 100 and this delta, the assertion is expected to fail once in 100 runs
      # for a sample size of 600 and this delta, the assertion is expected to fail once in a billion runs
      delta = 8.2765

      assert_in_delta(
        BafflingBirthdays.estimated_probability_of_shared_birthday(group_size),
        expected,
        delta
      )
    end

    @tag :pending
    test "among twenty-three people" do
      group_size = 23
      expected = 50.729723

      # for a sample size of 100 and this delta, the assertion is expected to fail once in 100 runs
      # for a sample size of 600 and this delta, the assertion is expected to fail once in a billion runs
      delta = 12.88

      assert_in_delta(
        BafflingBirthdays.estimated_probability_of_shared_birthday(group_size),
        expected,
        delta
      )
    end

    @tag :pending
    test "among seventy people" do
      group_size = 70
      expected = 99.915958

      # for a sample size of 100 and this delta, the assertion is expected to fail once in 100 runs
      # for a sample size of 600 and this delta, the assertion is expected to fail once in a billion runs
      delta = 0.83

      assert_in_delta(
        BafflingBirthdays.estimated_probability_of_shared_birthday(group_size),
        expected,
        delta
      )
    end
  end
end
