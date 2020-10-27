defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end
  def display_battery(%RemoteControlCar{battery_percentage: b}) do
    "Battery at #{b}%"
  end

  def drive(%RemoteControlCar{battery_percentage: b} = r) when b > 0 do
    d = r.distance_driven_in_meters
    %{r | battery_percentage: b - 1, distance_driven_in_meters: d + 20}
  end
  def drive(%RemoteControlCar{} = r), do: r
end
