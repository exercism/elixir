In this exercise you'll be playing around with a remote controlled car, which you've finally saved enough money for to buy.

Cars start with full (100%) batteries. Each time you drive the car using the remote control, it covers 20 meters and drains one percent of the battery. The car's nickname is not known until it is created.

The remote controlled car has a fancy LED display that shows two bits of information:

- The total distance it has driven, displayed as: `"<METERS> meters"`.
- The remaining battery charge, displayed as: `"Battery at <PERCENTAGE>%"`.

If the battery is at 0%, you can't drive the car anymore and the battery display will show `"Battery empty"`.

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

Implement the `RemoteControlCar.display_battery/1` function to return the distance as displayed on the LED display:

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_battery(car)
# => "Battery at 100%"
```

## 5. Driving changes the battery and distance driven

Implement the `RemoteControlCar.drive/1` function that:

- updates the number of meters driven by 20
- drains 1% of the battery

```elixir
RemoteControlCar.new("Red")
|> RemoteControlCar.drive()
# => %RemoteControlCar{
#      battery_percentage: 99,
#      distance_driven_in_meters: 20,
#      nickname: "Red"
#    }

```

## 6. Account for driving with a dead battery

Update the `RemoteControlCar.drive/1` function to not increase the distance driven nor decrease the battery percentage when the battery is drained (at 0%):

```elixir
%RemoteControlCar{
  battery_percentage: 0,
  distance_driven_in_meters: 1980,
  nickname: "Red"
}
|> RemoteControlCar.drive()
# => %RemoteControlCar{
#      battery_percentage: 0,
#      distance_driven_in_meters: 1980,
#      nickname: "Red"
#    }
```
