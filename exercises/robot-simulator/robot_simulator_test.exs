if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("robot_simulator.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule RobotSimulatorTest do
  use ExUnit.Case

  test "create has sensible defaults" do
    robot = RobotSimulator.create()
    assert RobotSimulator.position(robot) == {0, 0}
    assert RobotSimulator.direction(robot) == :north
  end

  @tag :pending
  test "create works with valid arguments" do
    robot = RobotSimulator.create(:north, {0, 0})
    assert RobotSimulator.position(robot) == {0, 0}
    assert RobotSimulator.direction(robot) == :north

    robot = RobotSimulator.create(:south, {-10, 0})
    assert RobotSimulator.position(robot) == {-10, 0}
    assert RobotSimulator.direction(robot) == :south

    robot = RobotSimulator.create(:east, {0, 10})
    assert RobotSimulator.position(robot) == {0, 10}
    assert RobotSimulator.direction(robot) == :east

    robot = RobotSimulator.create(:west, {100, -100})
    assert RobotSimulator.position(robot) == {100, -100}
    assert RobotSimulator.direction(robot) == :west
  end

  @tag :pending
  test "create errors if invalid direction given" do
    position = {0, 0}
    invalid_direction = {:error, "invalid direction"}

    assert RobotSimulator.create(:invalid, position) == invalid_direction
    assert RobotSimulator.create(0, position) == invalid_direction
    assert RobotSimulator.create("east", position) == invalid_direction
  end

  @tag :pending
  test "create errors if invalid position given" do
    direction = :north
    invalid_position = {:error, "invalid position"}

    assert RobotSimulator.create(direction, {0, 0, 0}) == invalid_position
    assert RobotSimulator.create(direction, {0, :invalid}) == invalid_position
    assert RobotSimulator.create(direction, {"0", 0}) == invalid_position

    assert RobotSimulator.create(direction, "invalid") == invalid_position
    assert RobotSimulator.create(direction, 0) == invalid_position
    assert RobotSimulator.create(direction, [0, 0]) == invalid_position
    assert RobotSimulator.create(direction, nil) == invalid_position
  end

  @tag :pending
  test "simulate robots" do
    robot1 = RobotSimulator.create(:north, {0, 0}) |> RobotSimulator.simulate("LAAARALA")
    assert RobotSimulator.direction(robot1) == :west
    assert RobotSimulator.position(robot1) == {-4, 1}

    robot2 = RobotSimulator.create(:east, {2, -7}) |> RobotSimulator.simulate("RRAAAAALA")
    assert RobotSimulator.direction(robot2) == :south
    assert RobotSimulator.position(robot2) == {-3, -8}

    robot3 = RobotSimulator.create(:south, {8, 4}) |> RobotSimulator.simulate("LAAARRRALLLL")
    assert RobotSimulator.direction(robot3) == :north
    assert RobotSimulator.position(robot3) == {11, 5}
  end

  @tag :pending
  test "simulate errors on invalid instructions" do
    assert RobotSimulator.create() |> RobotSimulator.simulate("UUDDLRLRBASTART") ==
             {:error, "invalid instruction"}
  end
end
