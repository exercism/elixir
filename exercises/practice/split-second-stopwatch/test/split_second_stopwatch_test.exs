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
    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:00]
  end

  @tag :pending
  test "new stopwatch's total has no elapsed time" do
    stopwatch = SplitSecondStopwatch.new()
    assert SplitSecondStopwatch.total(stopwatch) == ~T[00:00:00]
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
      |> SplitSecondStopwatch.advance_time(~T[00:00:05])

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:05]
  end

  @tag :pending
  test "start initiates time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:23])

    assert SplitSecondStopwatch.total(stopwatch) == ~T[00:00:23]
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
      |> SplitSecondStopwatch.advance_time(~T[00:00:05])
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(~T[00:00:08])

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:05]
  end

  @tag :pending
  test "stop pauses time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:13])
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(~T[00:00:44])

    assert SplitSecondStopwatch.total(stopwatch) == ~T[00:00:13]
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
      |> SplitSecondStopwatch.advance_time(~T[00:01:20])
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(~T[00:00:20])
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:08])

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:01:28]
  end

  @tag :pending
  test "start from stopped state resumes time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:23])
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.advance_time(~T[00:00:44])
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:09])

    assert SplitSecondStopwatch.total(stopwatch) == ~T[00:00:32]
  end

  @tag :pending
  test "lap adds current lap to previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:01:38])
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[00:01:38]
           ]

    stopwatch =
      stopwatch
      |> SplitSecondStopwatch.advance_time(~T[00:00:44])
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[00:01:38],
             ~T[00:00:44]
           ]
  end

  @tag :pending
  test "lap resets current lap and resumes time tracking" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:08:22])
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:00]

    stopwatch = SplitSecondStopwatch.advance_time(stopwatch, ~T[00:00:15])
    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:15]
  end

  @tag :pending
  test "lap continues time tracking for total" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:22])
      |> SplitSecondStopwatch.lap()
      |> SplitSecondStopwatch.advance_time(~T[00:00:33])

    assert SplitSecondStopwatch.total(stopwatch) == ~T[00:00:55]
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
      |> SplitSecondStopwatch.advance_time(~T[00:11:22])
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[00:11:22]
           ]

    stopwatch = SplitSecondStopwatch.stop(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[00:11:22]
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
      |> SplitSecondStopwatch.advance_time(~T[00:00:10])
      |> SplitSecondStopwatch.stop()
      |> SplitSecondStopwatch.reset()

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[00:00:00]
  end

  @tag :pending
  test "reset clears previous laps" do
    stopwatch =
      SplitSecondStopwatch.new()
      |> SplitSecondStopwatch.start()
      |> SplitSecondStopwatch.advance_time(~T[00:00:10])
      |> SplitSecondStopwatch.lap()
      |> SplitSecondStopwatch.advance_time(~T[00:00:20])
      |> SplitSecondStopwatch.lap()

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[00:00:10],
             ~T[00:00:20]
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
      |> SplitSecondStopwatch.advance_time(~T[01:23:45])

    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[01:23:45]

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[01:23:45]
           ]

    stopwatch = SplitSecondStopwatch.advance_time(stopwatch, ~T[04:01:40])
    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[04:01:40]
    assert SplitSecondStopwatch.total(stopwatch) == ~T[05:25:25]

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[01:23:45],
             ~T[04:01:40]
           ]

    stopwatch = SplitSecondStopwatch.advance_time(stopwatch, ~T[08:43:05])
    assert SplitSecondStopwatch.current_lap(stopwatch) == ~T[08:43:05]
    assert SplitSecondStopwatch.total(stopwatch) == ~T[14:08:30]

    stopwatch = SplitSecondStopwatch.lap(stopwatch)

    assert SplitSecondStopwatch.previous_laps(stopwatch) == [
             ~T[01:23:45],
             ~T[04:01:40],
             ~T[08:43:05]
           ]
  end
end
