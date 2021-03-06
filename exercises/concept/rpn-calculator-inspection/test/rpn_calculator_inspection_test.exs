defmodule RPNCalculatorInspectionTest do
  use ExUnit.Case

  describe "speed_check" do
    # @tag :pending
    test "passes when no inputs" do
      inputs = []
      calculator = fn {a, b} -> a + b end
      outputs = []
      assert RPNCalculatorInspection.speed_check(calculator, inputs) == outputs
    end

    @tag :pending
    test "passes when some inputs" do
      inputs = [{1, 0}, {1, 2}, {2, 3}]
      calculator = fn {a, b} -> a + b end
      outputs = [1, 3, 5]
      assert RPNCalculatorInspection.speed_check(calculator, inputs) == outputs
    end

    @tag :pending
    test "passes when 1000 different inputs" do
      inputs = Enum.map(0..999, &{1, &1})
      calculator = fn {a, b} -> a + b end
      outputs = Enum.map(0..999, &(1 + &1))
      assert RPNCalculatorInspection.speed_check(calculator, inputs) == outputs
    end

    @tag :pending
    test "passes when 1000 different inputs and the calculator takes 50ms for each calculation" do
      inputs = Enum.map(0..999, &{1, &1})
      calculator = fn {a, b} -> :timer.sleep(50) && a + b end
      outputs = Enum.map(0..999, &(1 + &1))
      assert RPNCalculatorInspection.speed_check(calculator, inputs) == outputs
    end

    @tag :pending
    test "awaits for a task for 100ms" do
      inputs = [{1, 1}]
      calculator = fn _ -> :timer.sleep(500) end

      Process.flag(:trap_exit, true)
      pid = spawn_link(fn -> RPNCalculatorInspection.speed_check(calculator, inputs) end)
      assert_receive msg = {:EXIT, ^pid, {:timeout, {Task, :await, [task, 100]}}}, 150
    end
  end
end
