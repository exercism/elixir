defmodule RPNCalculator.ExceptionTest do
  use ExUnit.Case

  config = ExUnit.configuration()

  # When modules used in the test suite don't exist, or don't implement the desired struct, a compile error occurs
  # so the test suite is never run, so using the cond to conditionally create test cases based on if the module is defined and loaded
  # allows for meaningful error messages.
  cond do
    config[:undefined_division_by_zero_error_module] ->
      @tag task_id: 1
      test "DivisionByZeroError defined" do
        flunk("Implement the DivisionByZeroError inside of the `RPNCalculator.Exception` module")
      end

    config[:undefined_division_by_zero_error_exception] ->
      @tag task_id: 1
      test "DivisionByZeroError defined" do
        flunk("define DivisionByZeroError exception using `defexception`")
      end

    true ->
      @tag task_id: 1
      test "DivisionByZeroError fields defined by `defexception`" do
        assert %RPNCalculator.Exception.DivisionByZeroError{}.__exception__ == true

        assert %RPNCalculator.Exception.DivisionByZeroError{}.__struct__ ==
                 RPNCalculator.Exception.DivisionByZeroError

        assert %RPNCalculator.Exception.DivisionByZeroError{}.message ==
                 "division by zero occurred"
      end

      @tag task_id: 1
      test "DivisionByZeroError message when raised with raise/1" do
        assert_raise(
          RPNCalculator.Exception.DivisionByZeroError,
          "division by zero occurred",
          fn ->
            raise RPNCalculator.Exception.DivisionByZeroError
          end
        )
      end
  end

  cond do
    config[:undefined_stack_underflow_error_module] ->
      @tag task_id: 2
      test "StackUnderflowError defined" do
        flunk("Implement the StackUnderflowError inside of the `RPNCalculator.Exception` module")
      end

    config[:undefined_stack_underflow_error_exception] ->
      @tag task_id: 2
      test "StackUnderflowError defined" do
        flunk("define StackUnderflowError exception using `defexception`")
      end

    true ->
      @tag task_id: 2
      test "StackUnderflowError fields defined by `defexception`" do
        assert %RPNCalculator.Exception.StackUnderflowError{}.__exception__ == true

        assert %RPNCalculator.Exception.StackUnderflowError{}.__struct__ ==
                 RPNCalculator.Exception.StackUnderflowError

        assert %RPNCalculator.Exception.StackUnderflowError{}.message ==
                 "stack underflow occurred"
      end

      @tag task_id: 2
      test "StackUnderflowError message when raised with raise/1" do
        assert_raise(
          RPNCalculator.Exception.StackUnderflowError,
          "stack underflow occurred",
          fn ->
            raise RPNCalculator.Exception.StackUnderflowError
          end
        )
      end

      @tag task_id: 2
      test "StackUnderflowError message when raised with raise/2" do
        assert_raise(
          RPNCalculator.Exception.StackUnderflowError,
          "stack underflow occurred, context: test",
          fn ->
            raise RPNCalculator.Exception.StackUnderflowError, "test"
          end
        )
      end
  end

  describe "divide/2" do
    @tag task_id: 3
    test "when stack doesn't contain any numbers, raise StackUnderflowError" do
      assert_raise(
        RPNCalculator.Exception.StackUnderflowError,
        "stack underflow occurred, context: when dividing",
        fn ->
          RPNCalculator.Exception.divide([])
        end
      )
    end

    @tag task_id: 3
    test "when stack contains only one number, raise StackUnderflowError" do
      assert_raise(
        RPNCalculator.Exception.StackUnderflowError,
        "stack underflow occurred, context: when dividing",
        fn ->
          RPNCalculator.Exception.divide([3])
        end
      )
    end

    @tag task_id: 3
    test "when stack contains only one number, raise StackUnderflowError, even when it's a zero" do
      assert_raise(
        RPNCalculator.Exception.StackUnderflowError,
        "stack underflow occurred, context: when dividing",
        fn ->
          RPNCalculator.Exception.divide([0])
        end
      )
    end

    @tag task_id: 3
    test "when divisor is 0, raise DivisionByZeroError" do
      assert_raise(RPNCalculator.Exception.DivisionByZeroError, "division by zero occurred", fn ->
        RPNCalculator.Exception.divide([0, 2])
      end)
    end

    @tag task_id: 3
    test "divisor is not 0, don't raise" do
      assert RPNCalculator.Exception.divide([2, 4]) == 2
    end
  end
end
