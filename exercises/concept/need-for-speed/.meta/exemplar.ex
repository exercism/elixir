defmodule NeedForSpeed do
    alias NeedForSpeed.Race
    alias NeedForSpeed.RemoteControlCar, as: Car

    import IO.ANSI
    import IO, only: [puts: 1]

  def print_race(%Race{} = race) do
    puts("""
    🏁 #{race.title} 🏁
    Status: #{Race.display_status(race)}
    Distance: #{Race.display_distance(race)}

    Contestants:
    """)

    race.cars
    |> Enum.sort_by(& &1.distance_driven_in_meters, :desc)
    |> Enum.with_index()
    |> Enum.each(fn {car, index} -> print_car(car, index + 1) end)
  end

  defp print_car(%Car{} = car, index) do
    color =
      case car.color do
        :red -> red()
        :blue -> cyan()
        :green -> green()
      end

    puts("""
      #{index}. #{color}#{car.nickname}#{default_color()}
      Distance: #{Car.display_distance(car)}
      Battery: #{Car.display_battery(car)}
    """)
  end
end
