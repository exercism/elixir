defmodule TakeANumberDeluxeTest do
  use ExUnit.Case

  alias TakeANumberDeluxe.Queue

  describe "start_link/1" do
    @tag task_id: 1
    test "starts a new process" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert is_pid(pid)
      assert pid != self()
      assert Process.alive?(pid)
    end

    @tag task_id: 1
    test "the process doesn't have a name" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert Process.info(pid, :registered_name) == {:registered_name, []}
    end

    @tag task_id: 1
    test "min and max numbers get validated" do
      assert TakeANumberDeluxe.start_link(min_number: 999, max_number: 99) ==
               {:error, :invalid_configuration}

      assert TakeANumberDeluxe.start_link(min_number: :not_a_number, max_number: 99) ==
               {:error, :invalid_configuration}

      assert TakeANumberDeluxe.start_link(min_number: 1, max_number: "not a number") ==
               {:error, :invalid_configuration}
    end

    @tag task_id: 1
    test "mix and max numbers can be passed in any order" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert is_pid(pid)

      {:ok, pid} = TakeANumberDeluxe.start_link(max_number: 333, min_number: 100)
      assert is_pid(pid)
    end

    @tag task_id: 1
    test "the init/1 GenServer callback is defined" do
      assert function_exported?(TakeANumberDeluxe, :init, 1)
    end
  end

  describe "report_state/1" do
    @tag task_id: 2
    test "returns the state of the current process" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 4, max_number: 55)
      {:ok, expected_state} = TakeANumberDeluxe.State.new(4, 55)
      assert TakeANumberDeluxe.report_state(pid) == expected_state
    end

    @tag task_id: 2
    test "different processes have different states" do
      {:ok, pid1} = TakeANumberDeluxe.start_link(min_number: 4, max_number: 55)
      {:ok, pid2} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 19)
      assert TakeANumberDeluxe.report_state(pid1) != TakeANumberDeluxe.report_state(pid2)
    end

    @tag task_id: 2
    test "the handle_call/3 GenServer callback is defined" do
      assert function_exported?(TakeANumberDeluxe, :handle_call, 3)
    end
  end

  describe "queue_new_number/1" do
    @tag task_id: 3
    test "returns the newly queued number" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 4, max_number: 55)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 4}
    end

    @tag task_id: 3
    test "can queue multiple numbers" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
    end

    @tag task_id: 3
    test "returns an error when there are no more available numbers" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 3)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:error, :all_possible_numbers_are_in_use}
    end

    @tag task_id: 3
    test "updates the state accordingly" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}

      assert TakeANumberDeluxe.report_state(pid) ==
               %TakeANumberDeluxe.State{
                 min_number: 1,
                 max_number: 99,
                 queue: Queue.new() |> Queue.push(1) |> Queue.push(2) |> Queue.push(3)
               }
    end
  end

  describe "serve_next_queued_number/1" do
    @tag task_id: 4
    test "returns the new number being served" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 100, max_number: 999)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 100}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 100}
    end

    @tag task_id: 4
    test "can serve multiple numbers" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 3}
    end

    @tag task_id: 4
    test "returns an error when there are no more queued" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 3)

      assert TakeANumberDeluxe.serve_next_queued_number(pid) ==
               {:error, :empty_queue}
    end

    @tag task_id: 4
    test "accepts a priority number to skip the queue" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
      assert TakeANumberDeluxe.serve_next_queued_number(pid, 3) == {:ok, 3}
    end

    @tag task_id: 4
    test "returns an error when the priority number is not in the queue" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 3)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}

      assert TakeANumberDeluxe.serve_next_queued_number(pid, 7) ==
               {:error, :priority_number_not_found}
    end

    @tag task_id: 4
    test "updates the state accordingly" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 2}

      assert TakeANumberDeluxe.report_state(pid) ==
               %TakeANumberDeluxe.State{
                 min_number: 1,
                 max_number: 99,
                 queue: Queue.from_list([3])
               }
    end
  end

  describe "reset_state/1" do
    @tag task_id: 5
    test "returns :ok" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.reset_state(pid) == :ok
    end

    @tag task_id: 5
    test "updates the state accordingly" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 7, max_number: 77)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 7}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 8}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 9}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 7}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 8}

      assert TakeANumberDeluxe.reset_state(pid) == :ok

      assert TakeANumberDeluxe.report_state(pid) ==
               %TakeANumberDeluxe.State{
                 min_number: 7,
                 max_number: 77,
                 queue: Queue.new()
               }
    end

    @tag task_id: 5
    test "the handle_cast/2 GenServer callback is defined" do
      assert function_exported?(TakeANumberDeluxe, :handle_cast, 2)
    end
  end

  describe "auto shutdown handling unexpected messages" do
    @tag task_id: 6
    test "auto shutdown works after initializing" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "auto shutdown works after reporting state" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.report_state(pid)
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "auto shutdown works after taking a new number" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "auto shutdown works after an error when taking a new number" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 2,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:error, :all_possible_numbers_are_in_use}
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "auto shutdown works after serving the next queued number" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 1}
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "auto shutdown works after an error when serving the next queued number" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:error, :empty_queue}
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "resetting state preserves the auto shutdown timeout" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      {:ok, expected_state} = TakeANumberDeluxe.State.new(1, 99, timeout)

      assert TakeANumberDeluxe.report_state(pid) == expected_state
      assert TakeANumberDeluxe.reset_state(pid)
      assert TakeANumberDeluxe.report_state(pid) == expected_state
    end

    @tag task_id: 6
    test "auto shutdown works after resetting state" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      assert TakeANumberDeluxe.reset_state(pid) == :ok
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "unexpected messages do not affect the state" do
      {:ok, pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 99)
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 1}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 2}
      assert TakeANumberDeluxe.queue_new_number(pid) == {:ok, 3}
      assert TakeANumberDeluxe.serve_next_queued_number(pid) == {:ok, 1}

      old_state = TakeANumberDeluxe.report_state(pid)

      send(pid, {:hello, "there"})

      assert TakeANumberDeluxe.report_state(pid) == old_state
    end

    @tag task_id: 6
    test "auto shutdown works after handling unexpected messages" do
      timeout = 50

      {:ok, pid} =
        TakeANumberDeluxe.start_link(
          min_number: 1,
          max_number: 99,
          auto_shutdown_timeout: timeout
        )

      assert Process.alive?(pid)
      send(pid, {:hello, "there"})
      assert Process.alive?(pid)
      :timer.sleep(timeout * 2)
      refute Process.alive?(pid)
    end

    @tag task_id: 6
    test "the handle_info/2 GenServer callback is defined" do
      assert function_exported?(TakeANumberDeluxe, :handle_info, 2)
    end
  end
end
