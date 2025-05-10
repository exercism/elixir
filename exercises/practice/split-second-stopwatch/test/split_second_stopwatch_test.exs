defmodule SplitSecondStopwatchTest do
  use ExUnit.Case

  # @tag :pending
  test "new stopwatch starts in ready state" do
    stopwatch = SplitSecondStopwatch.new()
    assert SplitSecondStopwatch.state(stopwatch) == :ready
  end

  @tag :pending
  test "new stopwatch's current lap has no elapsed time" do
    stopwatch = SplitSecondStopwatch.new()
    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 0)
  end

  @tag :pending
  test "new stopwatch's total has no elapsed time" do
    stopwatch = SplitSecondStopwatch.new()
    assert SplitSecondStopwatch.total(stopwatch) == Duration.new!(second: 0)
  end

  @tag :pending
  test "new stopwatch does not have previous laps" do
    stopwatch = SplitSecondStopwatch.new()
    assert SplitSecondStopwatch.previous_laps(stopwatch) == []
  end

  @tag :pending
  test "start from ready state changes state to running" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()

    assert SplitSecondStopwatch.state(stopwatch) == :running
  end

  @tag :pending
  test "start does not change previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == []
  end

  @tag :pending
  test "start initiates time tracking for current lap" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 5))

    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 5)
  end

  @tag :pending
  test "start initiates time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 23))

    assert SplitSecondStopwatch.total(stopwatch) == Duration.new!(second: 23)
  end

  @tag :pending
  test "start cannot be called from running state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.start()

    assert output == {:error, "cannot start an already running stopwatch"}
  end

  @tag :pending
  test "stop from running state changes state to stopped" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.stop()

    assert SplitSecondStopwatch.state(stopwatch) == :stopped
  end

  @tag :pending
  test "stop pauses time tracking for current lap" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 5))
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 8))

    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 5)
  end

  @tag :pending
  test "stop pauses time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 13))
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 44))

    assert SplitSecondStopwatch.total(stopwatch) == Duration.new!(second: 13)
  end

  @tag :pending
  test "stop cannot be called from ready state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.stop()

    assert output == {:error, "cannot stop a stopwatch that is not running"}
  end

  @tag :pending
  test "stop cannot be called from stopped state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.stop()

    assert output == {:error, "cannot stop a stopwatch that is not running"}
  end

  @tag :pending
  test "start from stopped state changes state to running" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.start()

    assert SplitSecondStopwatch.state(stopwatch) == :running
  end

  @tag :pending
  test "start from stopped state resumes time tracking for current lap" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(minute: 1, second: 20))
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 20))
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 8))

    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(minute: 1, second: 28)
  end

  @tag :pending
  test "start from stopped state resumes time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 23))
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 44))
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 9))

    assert SplitSecondStopwatch.total(stopwatch) == Duration.new!(second: 32)
  end

  @tag :pending
  test "lap adds current lap to previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(minute: 1, second: 38))
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(minute: 1, second: 38)
           ]

    stopwatch =
      stopwatch
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 44))
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(minute: 1, second: 38),
             Duration.new!(second: 44)
           ]
  end

  @tag :pending
  test "lap resets current lap and resumes time tracking" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(minute: 8, second: 22))
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 0)

    stopwatch = SplitSecondStopwatch.advance_time(stopwatch, Duration.new!(second: 15))
    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 15)
  end

  @tag :pending
  test "lap continues time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 22))
      |> SplitSecondStopwatch.lap()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 33))

    assert SplitSecondStopwatch.total(stopwatch) == Duration.new!(second: 55)
  end

  @tag :pending
  test "lap cannot be called from ready state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.lap()

    assert output == {:error, "cannot lap a stopwatch that is not running"}
  end

  @tag :pending
  test "lap cannot be called from stopped state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.lap()

    assert output == {:error, "cannot lap a stopwatch that is not running"}
  end

  @tag :pending
  test "stop does not change previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(minute: 11, second: 22))
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(minute: 11, second: 22)
           ]

    stopwatch = SplitSecondStopwatch.stop(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(minute: 11, second: 22)
           ]
  end

  @tag :pending
  test "reset from stopped state changes state to ready" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.reset()

    assert SplitSecondStopwatch.state(stopwatch) == :ready
  end

  @tag :pending
  test "reset resets current lap" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 10))
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.reset()

    assert SplitSecondStopwatch.current_lap(stopwatch) == Duration.new!(second: 0)
  end

  @tag :pending
  test "reset clears previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 10))
      |> SplitSecondStopwatch.lap()
      |> SplitSecondStopwatch.advance_time(Duration.new!(second: 20))
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(second: 10),
             Duration.new!(second: 20)
           ]

    stopwatch =
      stopwatch
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.reset()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == []
  end

  @tag :pending
  test "reset cannot be called from ready state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.reset()

    assert output == {:error, "cannot reset a stopwatch that is not stopped"}
  end

  @tag :pending
  test "reset cannot be called from running state" do
    output =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.reset()

    assert output == {:error, "cannot reset a stopwatch that is not stopped"}
  end

  @tag :pending
  test "supports very long laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(Duration.new!(hour: 1, minute: 23, second: 45))

    assert SplitSecondStopwatch.current_lap(stopwatch) ==
             Duration.new!(hour: 1, minute: 23, second: 45)

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(hour: 1, minute: 23, second: 45)
           ]

    stopwatch =
      SplitSecondStopwatch.advance_time(
        stopwatch,
        Duration.new!(hour: 4, minute: 1, second: 40)
      )

    assert SplitSecondStopwatch.current_lap(stopwatch) ==
             Duration.new!(hour: 4, minute: 1, second: 40)

    assert SplitSecondStopwatch.total(stopwatch) ==
             Duration.new!(hour: 5, minute: 25, second: 25)

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(hour: 1, minute: 23, second: 45),
             Duration.new!(hour: 4, minute: 1, second: 40)
           ]

    stopwatch =
      SplitSecondStopwatch.advance_time(
        stopwatch,
        Duration.new!(hour: 8, minute: 43, second: 5)
      )

    assert SplitSecondStopwatch.current_lap(stopwatch) ==
             Duration.new!(hour: 8, minute: 43, second: 5)

    assert SplitSecondStopwatch.total(stopwatch) ==
             Duration.new!(hour: 14, minute: 8, second: 30)

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             Duration.new!(hour: 1, minute: 23, second: 45),
             Duration.new!(hour: 4, minute: 1, second: 40),
             Duration.new!(hour: 8, minute: 43, second: 5)
           ]
  end
end
