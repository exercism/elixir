In this exercise you'll be playing around with a remote controlled car, which you've finally saved enough money for to buy.

Cars start with full (100%) batteries. Each time you drive the car using the remote control, it covers 20 meters and drains one percent of the battery. The car's nickname is not known until it is created.

The remote controlled car has a fancy LED display that shows two bits of information:

- The total distance it has driven, displayed as: `"<METERS> meters"`.
- The remaining battery charge, displayed as: `"Battery at <PERCENTAGE>%"`.

If the battery is at 0%, you can't drive the car anymore and the battery display will show `"Battery empty"`.

You have six tasks, each of which will work with remote controlled car instances.

## 1. Create a brand-new remote controlled car

Implement the `RemoteControlCar.new/0` function to return a brand-new remote controlled car struct:

```elixir
RemoteControlCar.new()
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "none"
#    }
```

The nickname is required by the struct, make sure that a value is initialized in the `new` function, but not in the struct.

## 2. Create a brand-new remote controlled car with a nickname

Implement the `RemoteControlCar.new/1` function to return a brand-new remote controlled car struct with a provided nickname:

```elixir
RemoteControlCar.new("Blue")
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "Blue"
#    }
```

## 3. Display the distance

Implement the `RemoteControlCar.display_distance/1` function to return the distance as displayed on the LED display:

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_distance(car)
# => "0 meters"
```

## 4. Display the battery percentage

Implement the `RemoteControlCar.BatteryDisplay()` function to return the distance as displayed on the LED display:

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_battery(car)
# => "Battery at 100%"
```

## 5. Driving changes the battery and distance driven

Implement the `RemoteControlCar.drive/1` function that:

- updates the number of meters driven
- updates the battery percentage

```elixir
RemoteControlCar.new()
|> RemoteControlCar.drive()
|> RemoteControlCar.drive()
|> RemoveControlCar.display_distance()
# => "40 meters"
```

## 6. Account for driving with a dead battery

Update the `RemoteControlCar.drive/1` function to not increase the distance driven nor decrease the battery percentage when the battery is drained (at 0%):

```elixir
car = RemoteControlCar.new()

# Drain the battery
# ...

car.display_distance()
# => "2000 meters"

car.display_battery()
# => "Battery empty"

car = RemoteControlCar.drive()

car.display_distance()
# => "2000 meters"

car.display_battery()
# => "Battery empty"
```
