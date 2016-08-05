if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("robot_simulator.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RobotMacros do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro ok_sim(direction, position) do
    quote do
      { :ok, %RobotSimulator{ direction: unquote(direction), position: unquote(position) } }
    end
  end
end

defmodule RobotSimulatorTest do
  use ExUnit.Case
  use RobotMacros

  test "create has sensible defaults" do
    assert RobotSimulator.create == ok_sim(:north, {0, 0})
  end

  @tag :pending
  test "create works with valid arguments" do
    assert RobotSimulator.create(:north, {0, 0}) == ok_sim(:north, {0, 0})
    assert RobotSimulator.create(:south, {-10, 0}) == ok_sim(:south, {-10, 0})
    assert RobotSimulator.create(:east, {0, 10}) == ok_sim(:east, {0, 10})
    assert RobotSimulator.create(:west, {100, -100}) == ok_sim(:west, {100, -100})
  end

  @tag :pending
  test "create errors if invalid direction given" do
    assert RobotSimulator.create(:invalid, {0, 0}) == { :error, "invalid direction" }
    assert RobotSimulator.create(0, {-10, 0}) == { :error, "invalid direction" }
    assert RobotSimulator.create("east", {0, 10}) == { :error, "invalid direction" }
  end

  @tag :pending
  test "create errors if invalid position given" do
    assert RobotSimulator.create(:north, "invalid") == { :error, "invalid position" }
    assert RobotSimulator.create(:north, 0 ) == { :error, "invalid position" }
    assert RobotSimulator.create(:north, [0, 0]) == { :error, "invalid position" }
    assert RobotSimulator.create(:north, nil) == { :error, "invalid position" }
  end

  @tag :pending
  test "simulate single robot" do
    { :ok, robot } = RobotSimulator.create(:east, { -2, 1 })

    assert RobotSimulator.simulate(robot, "RLAALAL") == ok_sim(:west, { 0, 2 })
  end

  @tag :pending
  test "simulate many robots" do
    { :ok, robot1 } = RobotSimulator.create(:north, { 0, 0 })
    { :ok, robot2 } = RobotSimulator.create(:east, { 2, -7 })
    { :ok, robot3 } = RobotSimulator.create(:south, { 8, 4 })

    assert RobotSimulator.simulate(robot1, "LAAARALA") == ok_sim(:west, { -4, 1 })
    assert RobotSimulator.simulate(robot2, "RRAAAAALA") == ok_sim(:south, { -3, -8 })
    assert RobotSimulator.simulate(robot3, "LAAARRRALLLL") == ok_sim(:north, { 11, 5 })
  end

  @tag :pending
  test "simulate errors on invalid instructions" do
    { :ok, robot } = RobotSimulator.create

    assert RobotSimulator.simulate(robot, "UUDDLRLRBASTART") == { :error, "invalid instruction" }
  end
end
