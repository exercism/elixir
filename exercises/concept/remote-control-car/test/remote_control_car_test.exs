defmodule FakeRemoteControlCar do
  defstruct battery_percentage: 100,
            distance_driven_in_meters: 0,
            nickname: nil
end

defmodule RemoteControlCarTest do
  use ExUnit.Case

  @tag task_id: 1
  test "required key 'nickname' should not have a default value" do
    assert_raise ArgumentError, fn ->
      quote do
        %RemoteControlCar{}
      end
      |> Code.eval_quoted()
    end
  end

  @tag task_id: 1
  test "new" do
    car = RemoteControlCar.new()

    assert car.__struct__ == RemoteControlCar
    assert car.battery_percentage == 100
    assert car.distance_driven_in_meters == 0
    assert car.nickname == "none"
  end

  @tag task_id: 2
  test "new with nickname" do
    nickname = "Red"
    car = RemoteControlCar.new(nickname)

    assert car.__struct__ == RemoteControlCar
    assert car.battery_percentage == 100
    assert car.distance_driven_in_meters == 0
    assert car.nickname == nickname
  end

  @tag task_id: 3
  test "display distance raises error when not given struct" do
    fake_car = %{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.display_distance(fake_car)
    end)
  end

  @tag task_id: 3
  test "display distance raises error when given unexpected struct" do
    fake_car = %FakeRemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.display_distance(fake_car)
    end)
  end

  @tag task_id: 3
  test "display distance of new" do
    car = RemoteControlCar.new()

    assert RemoteControlCar.display_distance(car) == "0 meters"
  end

  @tag task_id: 3
  test "display distance of driven" do
    car = RemoteControlCar.new()
    car = %{car | distance_driven_in_meters: 20}

    assert RemoteControlCar.display_distance(car) == "20 meters"
  end

  @tag task_id: 4
  test "display battery raises error when not given struct" do
    fake_car = %{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.display_battery(fake_car)
    end)
  end

  @tag task_id: 4
  test "display battery raises error when given unexpected struct" do
    fake_car = %FakeRemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.display_battery(fake_car)
    end)
  end

  @tag task_id: 4
  test "display battery of new" do
    car = RemoteControlCar.new()

    assert RemoteControlCar.display_battery(car) == "Battery at 100%"
  end

  @tag task_id: 4
  test "display battery of dead battery" do
    car = RemoteControlCar.new()
    car = %{car | battery_percentage: 0}

    assert RemoteControlCar.display_battery(car) == "Battery empty"
  end

  @tag task_id: 5
  test "drive raises error when not given struct" do
    fake_car = %{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.drive(fake_car)
    end)
  end

  @tag task_id: 5
  test "drive raises error when given unexpected struct" do
    fake_car = %FakeRemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "Fake"
    }

    assert_raise(FunctionClauseError, fn ->
      RemoteControlCar.drive(fake_car)
    end)
  end

  @tag task_id: 5
  test "drive with battery" do
    car = RemoteControlCar.new() |> RemoteControlCar.drive()

    assert car.__struct__ == RemoteControlCar
    assert car.battery_percentage == 99
    assert car.distance_driven_in_meters == 20
  end

  @tag task_id: 6
  test "drive with dead battery" do
    car =
      RemoteControlCar.new()
      |> Map.put(:battery_percentage, 0)
      |> RemoteControlCar.drive()

    assert car.__struct__ == RemoteControlCar
    assert car.battery_percentage == 0
    assert car.distance_driven_in_meters == 0
  end
end
