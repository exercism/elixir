defmodule RPNCalculatorTest do
  use ExUnit.Case

  test "let it crash" do
    assert_raise(RuntimeError, fn ->
      RPNCalculator.calculate!([], fn _ -> raise "test error" end)
    end)
  end

  test "rescue the crash, no message" do
    assert RPNCalculator.calculate([], fn _ -> raise "test error" end) == :error
  end

  test "rescue the crash, get error tuple with message" do
    assert RPNCalculator.calculate_verbose([], fn _ -> raise "test error" end) == {:error, "test error"}
  end
end
