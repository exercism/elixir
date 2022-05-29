defmodule Lasagna do

  def expected_minutes_in_oven, do: 40
  
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven - minutes
  end

  def preparation_time_in_minutes(layers), do: layers * 2

  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  def alarm, do: "Ding!"
end
