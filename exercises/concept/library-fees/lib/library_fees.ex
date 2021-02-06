defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def noon() do
    ~T[12:00:00]
  end

  def checked_out_before_noon?(datetime) do
    Time.compare(NaiveDateTime.to_time(datetime), noon()) == :lt
  end

  def return_datetime(checkout_datetime) do
    days = if checked_out_before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.add(checkout_datetime, days * 24 * 60 * 60, :seconds)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def days_late(planned_return_datetime, actual_return_datetime) do
    diff =
      Date.diff(
        NaiveDateTime.to_date(actual_return_datetime),
        NaiveDateTime.to_date(planned_return_datetime)
      )

    if diff < 0, do: 0, else: diff
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planned_return_datetime = return_datetime(checkout_datetime)
    actual_return_datetime = datetime_from_string(return)

    days_late = days_late(planned_return_datetime, actual_return_datetime)
    rate = if monday?(actual_return_datetime), do: 0.5 * rate, else: rate
    days_late * rate
  end
end
