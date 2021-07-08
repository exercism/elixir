defmodule NeedForSpeedTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "print_race" do
    @tag task_id: nil
    test "prints a race with no cars" do
      race = %NeedForSpeed.Race{
        title: "Need For Speed 2021",
        total_distance_in_meters: 350,
        cars: []
      }

      io = capture_io(fn -> NeedForSpeed.print_race(race) end)

      assert io == """
             🏁 Need For Speed 2021 🏁
             Status: Not Started
             Distance: 350 meters

             Contestants:

             """
    end

    @tag task_id: nil
    test "prints a race with a red car" do
      car = NeedForSpeed.RemoteControlCar.new(:red, "The Fox")

      race = %NeedForSpeed.Race{
        title: "Need For Speed 2021",
        total_distance_in_meters: 500,
        cars: [car]
      }

      io = capture_io(fn -> NeedForSpeed.print_race(race) end)

      assert io == """
             🏁 Need For Speed 2021 🏁
             Status: Not Started
             Distance: 500 meters

             Contestants:

               1. #{IO.ANSI.red()}The Fox#{IO.ANSI.default_color()}
               Distance: 0 meters
               Battery: Battery at 100%

             """
    end

    @tag task_id: nil
    test "prints a race with a blue car" do
      car = NeedForSpeed.RemoteControlCar.new(:blue, "The Hurricane")

      race = %NeedForSpeed.Race{
        title: "Need For Speed 2021",
        total_distance_in_meters: 500,
        cars: [car]
      }

      io = capture_io(fn -> NeedForSpeed.print_race(race) end)

      assert io == """
             🏁 Need For Speed 2021 🏁
             Status: Not Started
             Distance: 500 meters

             Contestants:

               1. #{IO.ANSI.cyan()}The Hurricane#{IO.ANSI.default_color()}
               Distance: 0 meters
               Battery: Battery at 100%

             """
    end

    @tag task_id: nil
    test "prints a race with a green car" do
      car = NeedForSpeed.RemoteControlCar.new(:green, "The Grasshopper")

      race = %NeedForSpeed.Race{
        title: "Need For Speed 2021",
        total_distance_in_meters: 777,
        cars: [car]
      }

      io = capture_io(fn -> NeedForSpeed.print_race(race) end)

      assert io == """
             🏁 Need For Speed 2021 🏁
             Status: Not Started
             Distance: 777 meters

             Contestants:

               1. #{IO.ANSI.green()}The Grasshopper#{IO.ANSI.default_color()}
               Distance: 0 meters
               Battery: Battery at 100%

             """
    end

    @tag task_id: nil
    test "prints a race in progress with many cars" do
      red_car = NeedForSpeed.RemoteControlCar.new(:red, "The Fox")
      blue_car = NeedForSpeed.RemoteControlCar.new(:blue, "The Hurricane")
      green_car = NeedForSpeed.RemoteControlCar.new(:green, "The Grasshopper")
      red_car = %{red_car | distance_driven_in_meters: 305, battery_percentage: 70}
      blue_car = %{blue_car | distance_driven_in_meters: 500, battery_percentage: 62}
      green_car = %{green_car | distance_driven_in_meters: 235, battery_percentage: 60}

      race = %NeedForSpeed.Race{
        title: "Need For Speed 2021",
        total_distance_in_meters: 1000,
        cars: [red_car, blue_car, green_car]
      }

      io = capture_io(fn -> NeedForSpeed.print_race(race) end)

      assert io == """
             🏁 Need For Speed 2021 🏁
             Status: In Progress
             Distance: 1000 meters

             Contestants:

               1. #{IO.ANSI.cyan()}The Hurricane#{IO.ANSI.default_color()}
               Distance: 500 meters
               Battery: Battery at 62%

               2. #{IO.ANSI.red()}The Fox#{IO.ANSI.default_color()}
               Distance: 305 meters
               Battery: Battery at 70%

               3. #{IO.ANSI.green()}The Grasshopper#{IO.ANSI.default_color()}
               Distance: 235 meters
               Battery: Battery at 60%

             """
    end
  end
end
