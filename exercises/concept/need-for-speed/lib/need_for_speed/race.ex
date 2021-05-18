defmodule NeedForSpeed.Race do
  defstruct [
    :title,
    :total_distance_in_meters,
    cars: []
  ]

  def display_status(%__MODULE__{} = race) do
    cond do
      Enum.any?(race.cars, &(&1.distance_driven_in_meters >= race.total_distance_in_meters)) ->
        "Finished"

      Enum.any?(race.cars, &(&1.distance_driven_in_meters > 0)) ->
        "In Progress"

      true ->
        "Not Started"
    end
  end

  def display_distance(%__MODULE__{total_distance_in_meters: d}) do
    "#{d} meters"
  end
end
