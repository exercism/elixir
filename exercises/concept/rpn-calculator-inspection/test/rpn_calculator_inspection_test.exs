defmodule RPNCalculatorInspectionTest do
  use ExUnit.Case, async: false

  defmodule RPNCalculator do
    def unsafe_division(input) do
      [_, a, b] = Regex.run(~r/^(\d*) (\d*) \/$/, input)
      String.to_integer(a) / String.to_integer(b)
    end
  end

  defp flush_messages() do
    receive do
      _ ->
        flush_messages()
    after
      50 ->
        nil
    end
  end

  setup_all do
    # turning off the logger to avoid error logs spamming the output
    # when the functions are expected to crash
    Logger.configure(level: :none)
  end

  setup do
    # just in case, we clear the test process inbox before each test
    flush_messages()
    %{}
  end

  describe "start_reliability_check" do
    @tag task_id: 1
    test "returns a map with test data" do
      calculator = fn _ -> 0 end
      input = "1 2 +"
      result = RPNCalculatorInspection.start_reliability_check(calculator, input)
      assert is_map(result)
      assert is_pid(result.pid)
      assert result.input == input
    end

    @tag task_id: 1
    test "starts a linked process" do
      old_value = Process.flag(:trap_exit, true)

      calculator = fn _ -> :timer.sleep(50) end
      input = "1 2 +"

      %{pid: pid} = RPNCalculatorInspection.start_reliability_check(calculator, input)

      assert pid in Keyword.get(Process.info(self()), :links)
      assert_receive {:EXIT, ^pid, :normal}

      Process.flag(:trap_exit, old_value)
    end

    @tag task_id: 1
    test "the process runs the calculator function with the given input" do
      caller_process_pid = self()

      calculator = fn input -> send(caller_process_pid, input) end
      input = "7 3 +"

      RPNCalculatorInspection.start_reliability_check(calculator, input)

      assert_receive ^input
    end
  end

  describe "await_reliability_check_result" do
    @tag task_id: 2
    test "adds `input` => :ok to the results after a normal exit" do
      caller_process_pid = self()
      test_data = %{pid: caller_process_pid, input: "2 3 +"}
      check_results_so_far = %{"2 0 /" => :error}
      expected_result = %{"2 0 /" => :error, "2 3 +" => :ok}

      send(caller_process_pid, {:EXIT, caller_process_pid, :normal})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result
    end

    @tag task_id: 2
    test "adds `input` => :error to the results after an abnormal exit" do
      caller_process_pid = self()
      test_data = %{pid: caller_process_pid, input: "3 0 /"}
      check_results_so_far = %{"1 1 +" => :ok}
      expected_result = %{"1 1 +" => :ok, "3 0 /" => :error}

      send(caller_process_pid, {:EXIT, caller_process_pid, {%ArithmeticError{}, []}})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result
    end

    @tag task_id: 2
    test "adds `input` => :timeout to the results if no message arrives in 100ms" do
      caller_process_pid = self()
      test_data = %{pid: caller_process_pid, input: "24 12 /"}
      check_results_so_far = %{"3 1 +" => :ok}
      expected_result = %{"3 1 +" => :ok, "24 12 /" => :timeout}

      task =
        Task.async(fn ->
          :timer.sleep(200)
          # this message should arrive too late
          send(caller_process_pid, {:EXIT, caller_process_pid, {%ArithmeticError{}, []}})
        end)

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      Task.await(task)
    end

    @tag task_id: 2
    test "normal exit messages from processes whose pids don't match stay in the inbox" do
      caller_process_pid = self()
      other_process_pid = spawn(fn -> nil end)
      test_data = %{pid: caller_process_pid, input: "5 0 /"}
      check_results_so_far = %{"5 0 +" => :ok}
      expected_result = %{"5 0 +" => :ok, "5 0 /" => :error}

      send(caller_process_pid, {:EXIT, other_process_pid, :normal})
      send(caller_process_pid, {:EXIT, caller_process_pid, {%ArithmeticError{}, []}})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      assert Keyword.get(Process.info(self()), :message_queue_len) == 1
    end

    @tag task_id: 2
    test "abnormal exit messages from processes whose pids don't match stay in the inbox" do
      caller_process_pid = self()
      other_process_pid = spawn(fn -> nil end)
      test_data = %{pid: caller_process_pid, input: "2 2 +"}
      check_results_so_far = %{"0 0 /" => :error}
      expected_result = %{"0 0 /" => :error, "2 2 +" => :ok}

      send(caller_process_pid, {:EXIT, other_process_pid, {%ArithmeticError{}, []}})
      send(caller_process_pid, {:EXIT, caller_process_pid, :normal})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      assert Keyword.get(Process.info(self()), :message_queue_len) == 1
    end

    @tag task_id: 2
    test "any other messages stay in the inbox" do
      caller_process_pid = self()
      test_data = %{pid: caller_process_pid, input: "4 2 /"}
      check_results_so_far = %{"4 0 /" => :error}
      expected_result = %{"4 0 /" => :error, "4 2 /" => :ok}

      send(caller_process_pid, {:exit, caller_process_pid, {%ArithmeticError{}, []}})
      send(caller_process_pid, {:something_else, caller_process_pid, {%ArithmeticError{}, []}})
      send(caller_process_pid, :something_else)
      send(caller_process_pid, {:EXIT, caller_process_pid, :normal})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      assert Keyword.get(Process.info(self()), :message_queue_len) == 3
    end

    @tag task_id: 2
    test "doesn't change the trap_exit flag of the caller process" do
      caller_process_pid = self()
      Process.flag(:trap_exit, false)

      test_data = %{pid: caller_process_pid, input: "30 3 /"}
      check_results_so_far = %{}
      expected_result = %{"30 3 /" => :ok}

      send(caller_process_pid, {:EXIT, caller_process_pid, :normal})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      assert Keyword.get(Process.info(self()), :trap_exit) == false
      Process.flag(:trap_exit, true)

      send(caller_process_pid, {:EXIT, caller_process_pid, :normal})

      assert RPNCalculatorInspection.await_reliability_check_result(
               test_data,
               check_results_so_far
             ) ==
               expected_result

      assert Keyword.get(Process.info(self()), :trap_exit) == true
    end
  end

  describe "reliability_check" do
    @tag task_id: 3
    test "returns an empty map when input list empty" do
      inputs = []
      calculator = &RPNCalculator.unsafe_division/1
      outputs = %{}
      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
    end

    @tag task_id: 3
    test "returns a map with inputs as keys and :ok as values" do
      inputs = ["4 2 /", "8 2 /", "6 3 /"]
      calculator = &RPNCalculator.unsafe_division/1

      outputs = %{
        "4 2 /" => :ok,
        "8 2 /" => :ok,
        "6 3 /" => :ok
      }

      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
    end

    @tag task_id: 3
    test "returns a map when input list has 1000 elements" do
      inputs = Enum.map(1..1000, &"#{2 * &1} #{&1} /")
      calculator = &RPNCalculator.unsafe_division/1
      outputs = 1..1000 |> Enum.map(&{"#{2 * &1} #{&1} /", :ok}) |> Enum.into(%{})

      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
    end

    @tag task_id: 3
    test "returns a map when input list has 1000 elements and the calculator takes 50ms for each calculation" do
      inputs = Enum.map(1..1000, &"#{2 * &1} #{&1} /")
      parent_pid = self()
      calculator = fn input -> :timer.sleep(50) && RPNCalculator.unsafe_division(input) end

      Task.start_link(fn ->
        outputs = RPNCalculatorInspection.reliability_check(calculator, inputs)
        send(parent_pid, {:outputs, outputs})
      end)

      expected = 1..1000 |> Enum.map(&{"#{2 * &1} #{&1} /", :ok}) |> Enum.into(%{})

      assert_receive(
        {:outputs, ^expected},
        5000,
        "This test shouldn't take this long to complete. Make sure to start all tasks first before awaiting them."
      )
    end

    @tag task_id: 3
    test "returns :error values for inputs that cause the calculator to crash" do
      inputs = ["3 0 /", "22 11 /", "4 0 /"]
      calculator = &RPNCalculator.unsafe_division/1

      outputs = %{
        "3 0 /" => :error,
        "22 11 /" => :ok,
        "4 0 /" => :error
      }

      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
    end

    @tag task_id: 3
    test "returns a map when input list has 1000 elements and all of them crash" do
      inputs = Enum.map(1..1000, &"#{2 * &1} 0 /")
      calculator = &RPNCalculator.unsafe_division/1
      outputs = 1..1000 |> Enum.map(&{"#{2 * &1} 0 /", :error}) |> Enum.into(%{})

      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
    end

    @tag task_id: 3
    test "restores the original value of the trap_exit flag" do
      inputs = ["3 0 /", "22 11 /", "4 0 /"]
      calculator = &RPNCalculator.unsafe_division/1

      outputs = %{
        "3 0 /" => :error,
        "22 11 /" => :ok,
        "4 0 /" => :error
      }

      Process.flag(:trap_exit, false)
      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
      assert Keyword.get(Process.info(self()), :trap_exit) == false

      Process.flag(:trap_exit, true)
      assert RPNCalculatorInspection.reliability_check(calculator, inputs) == outputs
      assert Keyword.get(Process.info(self()), :trap_exit) == true
    end
  end

  describe "correctness_check" do
    @tag task_id: 4
    test "returns an empty list when input list empty" do
      inputs = []
      calculator = &RPNCalculator.unsafe_division/1
      outputs = []
      assert RPNCalculatorInspection.correctness_check(calculator, inputs) == outputs
    end

    @tag task_id: 4
    test "returns a list of results" do
      inputs = ["3 2 /", "4 2 /", "5 2 /"]
      calculator = &RPNCalculator.unsafe_division/1
      outputs = [1.5, 2, 2.5]
      assert RPNCalculatorInspection.correctness_check(calculator, inputs) == outputs
    end

    @tag task_id: 4
    test "returns a list of results when input list has 1000 elements" do
      inputs = Enum.map(1..1000, &"100 #{&1} /")
      calculator = &RPNCalculator.unsafe_division/1
      outputs = Enum.map(1..1000, &(100 / &1))
      assert RPNCalculatorInspection.correctness_check(calculator, inputs) == outputs
    end

    @tag task_id: 4
    test "returns a list of results when input list has 1000 elements and the calculator takes 50ms for each calculation" do
      inputs = Enum.map(1..1000, &"100 #{&1} /")
      parent_pid = self()
      calculator = fn input -> :timer.sleep(50) && RPNCalculator.unsafe_division(input) end

      Task.start_link(fn ->
        outputs = RPNCalculatorInspection.correctness_check(calculator, inputs)
        send(parent_pid, {:outputs, outputs})
      end)

      expected = Enum.map(1..1000, &(100 / &1))

      assert_receive(
        {:outputs, ^expected},
        5000,
        "This test shouldn't take this long to complete. Make sure to start all tasks first before awaiting them."
      )
    end

    @tag task_id: 4
    test "awaits a single task for 100ms" do
      inputs = ["1 1 /1"]
      calculator = fn _ -> :timer.sleep(500) end

      Process.flag(:trap_exit, true)
      pid = spawn_link(fn -> RPNCalculatorInspection.correctness_check(calculator, inputs) end)

      assert_receive {:EXIT, ^pid, {:timeout, {Task, task_fn, [_task, 100]}}}
                     when task_fn in [:await, :await_many],
                     150,
                     "expected to receive a timemout message from Task.await/2 or Task.await_many/2"

      Process.flag(:trap_exit, false)
    end
  end
end
