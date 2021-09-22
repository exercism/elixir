defmodule RPNCalculatorTest do
  use ExUnit.Case

  @success {:ok, "operation completed"}
  @test_error {:error, "test error"}

  @tag task_id: 1
  test "calculate! returns an :ok atom" do
    assert RPNCalculator.calculate!([], fn _ -> :ok end) == :ok
  end

  @tag task_id: 1
  test "let it crash" do
    assert_raise(RuntimeError, fn ->
      RPNCalculator.calculate!([], fn _ -> raise "test error" end)
    end)
  end

  @tag task_id: 2
  test "calculate returns a tuple" do
    assert RPNCalculator.calculate([], fn _ -> "operation completed" end) == @success
  end

  @tag task_id: 2
  test "rescue the crash, no message" do
    assert RPNCalculator.calculate([], fn _ -> raise "test error" end) == :error
  end

  @tag task_id: 3
  test "calculate_verbose returns a tuple" do
    assert RPNCalculator.calculate_verbose([], fn _ -> "operation completed" end) == @success
  end

  @tag task_id: 3
  test "rescue the crash, get error tuple with message" do
    assert RPNCalculator.calculate_verbose([], fn _ -> raise ArgumentError, "test error" end) ==
             @test_error
  end
end
