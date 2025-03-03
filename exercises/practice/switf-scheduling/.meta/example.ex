defmodule SwiftScheduling do
  @doc """
  TODO
  """
  @spec delivery_date(NaiveDateTime.t(), String.t()) :: NaiveDateTime.t()
  def delivery_date(meeting_date, description) do
    cond do
      description == "NOW" -> now(meeting_date)
      description == "ASAP" -> asap(meeting_date)
      description == "EOW" -> eow(meeting_date)
      match = Regex.run(~r[^(\d+)M$], description) -> nth_month(meeting_date, match)
      match = Regex.run(~r[^Q(\d+)$], description) -> nth_quarter(meeting_date, match)
    end
  end

  defp now(meeting_date) do
    NaiveDateTime.add(meeting_date, 2, :hour)
  end

  defp asap(meeting_date) do
    before_noon? =
      meeting_date
      |> NaiveDateTime.to_time()
      |> Time.compare(~T[12:00:00])
      |> Kernel.==(:lt)

    [new_date, new_time] =
      if before_noon? do
        [meeting_date |> NaiveDateTime.to_date(), ~T[17:00:00]]
      else
        [
          meeting_date
          |> NaiveDateTime.to_date()
          |> Date.add(1),
          ~T[12:00:00]
        ]
      end

    NaiveDateTime.new!(new_date, new_time)
  end

  defp eow(meeting_date) do
    before_thursday? =
      meeting_date
      |> NaiveDateTime.to_date()
      |> Date.day_of_week()
      |> Kernel.<(4)

    sunday =
      meeting_date
      |> NaiveDateTime.to_date()
      |> Date.end_of_week()

    [new_date, new_time] =
      if before_thursday? do
        friday = Date.add(sunday, -2)
        [friday, ~T[17:00:00]]
      else
        [sunday, ~T[20:00:00]]
      end

    NaiveDateTime.new!(new_date, new_time)
  end

  defp nth_month(meeting_date, [_, month]) do
    month_number = String.to_integer(month)
    schedule_for_this_year? = meeting_date.month < month_number

    new_time = ~T[08:00:00]

    nth_month_this_year = %{NaiveDateTime.to_date(meeting_date) | month: month_number}

    new_date =
      if schedule_for_this_year? do
        first_workday_of_month(nth_month_this_year)
      else
        nth_month_next_year = nth_month_this_year |> Date.shift(year: 1)
        first_workday_of_month(nth_month_next_year)
      end

    NaiveDateTime.new!(new_date, new_time)
  end

  defp nth_quarter(meeting_date, [_, quarter]) do
    quarter_number = String.to_integer(quarter)
    schedule_for_this_year? = meeting_date.month <= quarter_number * 3

    new_time = ~T[08:00:00]

    last_month_of_nth_quarter_this_year = %{
      NaiveDateTime.to_date(meeting_date)
      | month: quarter_number * 3
    }

    new_date =
      if schedule_for_this_year? do
        last_workday_of_month(last_month_of_nth_quarter_this_year)
      else
        last_month_of_nth_quarter_next_year =
          last_month_of_nth_quarter_this_year
          |> Date.shift(year: 1)

        last_workday_of_month(last_month_of_nth_quarter_next_year)
      end

    NaiveDateTime.new!(new_date, new_time)
  end

  defp first_workday_of_month(date) do
    first_day_of_month =
      date
      |> Date.beginning_of_month()

    case Date.day_of_week(first_day_of_month) do
      n when n in 1..5 -> first_day_of_month
      6 -> Date.add(first_day_of_month, 2)
      7 -> Date.add(first_day_of_month, 1)
    end
  end

  defp last_workday_of_month(date) do
    first_day_of_month =
      date
      |> Date.end_of_month()

    case Date.day_of_week(first_day_of_month) do
      n when n in 1..5 -> first_day_of_month
      6 -> Date.add(first_day_of_month, -1)
      7 -> Date.add(first_day_of_month, -2)
    end
  end
end
