defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven, do: 40
  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven - minutes
  end
  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers), do: layers * 2
  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end
  # Please define the 'alarm/0' function
  def alarm, do: "Ding!"
end
