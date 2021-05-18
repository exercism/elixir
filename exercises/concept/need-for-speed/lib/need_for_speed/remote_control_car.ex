defmodule NeedForSpeed.RemoteControlCar do
  defstruct [
    :nickname,
    :color,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(color, nickname) when color in [:red, :blue, :green] do
    %__MODULE__{nickname: nickname, color: color}
  end

  def display_distance(%__MODULE__{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%__MODULE__{battery_percentage: b}) do
    "Battery at #{b}%"
  end
end
