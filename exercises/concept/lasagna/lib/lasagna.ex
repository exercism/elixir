defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(time_spent), do: expected_minutes_in_oven() - time_spent
  def preparation_time_in_minutes(layers), do: 2*layers
  def total_time_in_minutes(layers,time_spent), do: preparation_time_in_minutes(layers) + time_spent
  def alarm(), do: "Ding!"
end
