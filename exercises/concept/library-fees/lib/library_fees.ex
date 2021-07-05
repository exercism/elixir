defmodule LibraryFees do
  def datetime_from_string(string) do
    raise "Please implement the datetime_from_string/1 function"
  end

  def before_noon?(datetime) do
    raise "Please implement the before_noon?/1 function"
  end

  def return_date(checkout_datetime) do
    raise "Please implement the return_date/1 function"
  end

  def days_late(planned_return_date, actual_return_datetime) do
    raise "Please implement the days_late/2 function"
  end

  def monday?(datetime) do
    raise "Please implement the monday?/1 function"
  end

  def calculate_late_fee(checkout, return, rate) do
    raise "Please implement the calculate_late_fee/3 function"
  end
end
